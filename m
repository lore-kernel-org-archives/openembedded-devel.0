Received: from [66.249.82.226] (helo=wx-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Jjr66-00072F-GW
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Apr 2008 09:21:27 +0200
Received: by wx-out-0506.google.com with SMTP id h27so3185519wxd.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Apr 2008 00:21:21 -0700 (PDT)
Received: by 10.141.153.17 with SMTP id f17mr577618rvo.44.1207812080576;
	Thu, 10 Apr 2008 00:21:20 -0700 (PDT)
Received: from ?192.168.1.71? ( [71.146.14.115])
	by mx.google.com with ESMTPS id b39sm1631314rvf.8.2008.04.10.00.21.19
	(version=SSLv3 cipher=RC4-MD5); Thu, 10 Apr 2008 00:21:20 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Date: Thu, 10 Apr 2008 00:21:18 -0700
Message-Id: <1207812078.18054.4.camel@isis>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.1 
Subject: Add gdb 6.8 recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 10 Apr 2008 07:21:31 -0000
X-Groupsio-MsgNum: 4932
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-RSa7KWkz3RmC3QZ5zNSo"

--=-RSa7KWkz3RmC3QZ5zNSo
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Hi

Attached patch adds gdb-6.8 recipe. I have tested it for qemuarm glibc targ=
ets. It works
It would be good if someone trying it on other arch too.

OK?

TIA

-Khem

#
# old_revision [2a4071bf6fa0d60eb5e42a1a770a282d67c77531]
#
# add_dir "packages/gdb/gdb-6.8"
#=20
# add_file "packages/gdb/gdb-6.8/early_debug_in_nptl.patch"
#  content [6e027b2499da589384a40847de046842934ba44e]
#=20
# add_file "packages/gdb/gdb-cross-sdk_6.8.bb"
#  content [9444a910f04467593c5c669381d5ed60212c8324]
#=20
# add_file "packages/gdb/gdb-cross_6.8.bb"
#  content [0ea423cc4dde24b7f31c9c213c5c9016bcee6ed5]
#=20
# add_file "packages/gdb/gdb_6.8.bb"
#  content [46a7734cc95c48722b3546e977c35ed0591233c9]
#
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- packages/gdb/gdb-6.8/early_debug_in_nptl.patch	6e027b2499da589384a40847=
de046842934ba44e
+++ packages/gdb/gdb-6.8/early_debug_in_nptl.patch	6e027b2499da589384a40847=
de046842934ba44e
@@ -0,0 +1,306 @@
+http://sourceware.org/ml/gdb-patches/2007-06/msg00479.html
+
+Index: gdb/linux-thread-db.c
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- gdb/linux-thread-db.c.orig	2006-10-20 03:08:14.000000000 +0200
++++ gdb/linux-thread-db.c	2008-03-01 14:45:52.000000000 +0100
+@@ -213,6 +213,21 @@
+     }
+ }
+ =0C
++/* Return 1 if any threads have been registered.  There may be none if
++   the threading library is not fully initialized yet.  */
++
++static int
++have_threads_callback (struct thread_info *thread, void *dummy)
++{
++  return 1;
++}
++
++static int
++have_threads (void)
++{
++  return iterate_over_threads (have_threads_callback, NULL) !=3D NULL;
++}
++
+ /* A callback function for td_ta_thr_iter, which we use to map all
+    threads to LWPs.
+=20
+@@ -700,23 +715,6 @@
+ }
+=20
+ static void
+-thread_db_attach (char *args, int from_tty)
+-{
+-  target_beneath->to_attach (args, from_tty);
+-
+-  /* Destroy thread info; it's no longer valid.  */
+-  init_thread_list ();
+-
+-  /* The child process is now the actual multi-threaded
+-     program.  Snatch its process ID...  */
+-  proc_handle.pid =3D GET_PID (inferior_ptid);
+-
+-  /* ...and perform the remaining initialization steps.  */
+-  enable_thread_event_reporting ();
+-  thread_db_find_new_threads ();
+-}
+-
+-static void
+ detach_thread (ptid_t ptid, int verbose)
+ {
+   struct thread_info *thread_info;
+@@ -742,14 +740,13 @@
+   disable_thread_event_reporting ();
+=20
+   /* There's no need to save & restore inferior_ptid here, since the
+-     inferior is supposed to be survive this function call.  */
++     inferior is not supposed to survive this function call.  */
+   inferior_ptid =3D lwp_from_thread (inferior_ptid);
+=20
+-  /* Forget about the child's process ID.  We shouldn't need it
+-     anymore.  */
+-  proc_handle.pid =3D 0;
+-
+   target_beneath->to_detach (args, from_tty);
++
++  /* Should this be done by detach_command?  */
++  target_mourn_inferior ();
+ }
+=20
+ static int
+@@ -870,12 +867,6 @@
+=20
+   ptid =3D target_beneath->to_wait (ptid, ourstatus);
+=20
+-  if (proc_handle.pid =3D=3D 0)
+-    /* The current child process isn't the actual multi-threaded
+-       program yet, so don't try to do any special thread-specific
+-       post-processing and bail out early.  */
+-    return ptid;
+-
+   if (ourstatus->kind =3D=3D TARGET_WAITKIND_EXITED
+     || ourstatus->kind =3D=3D TARGET_WAITKIND_SIGNALLED)
+     return pid_to_ptid (-1);
+@@ -889,23 +880,32 @@
+       return pid_to_ptid (GET_PID (ptid));
+     }
+=20
++  /* If we do not know about the main thread yet, this would be a good ti=
me to
++     find it.  */
++  if (ourstatus->kind =3D=3D TARGET_WAITKIND_STOPPED && !have_threads ())
++    thread_db_find_new_threads ();
++
+   if (ourstatus->kind =3D=3D TARGET_WAITKIND_STOPPED
+       && ourstatus->value.sig =3D=3D TARGET_SIGNAL_TRAP)
+     /* Check for a thread event.  */
+     check_event (ptid);
+=20
+-  if (!ptid_equal (trap_ptid, null_ptid))
+-    trap_ptid =3D thread_from_lwp (trap_ptid);
++  if (have_threads ())
++    {
++      /* Change ptids back into the higher level PID + TID format.  If
++	 the thread is dead and no longer on the thread list, we will
++	 get back a dead ptid.  This can occur if the thread death
++	 event gets postponed by other simultaneous events.  In such a
++	 case, we want to just ignore the event and continue on.  */
++
++      if (!ptid_equal (trap_ptid, null_ptid))
++	trap_ptid =3D thread_from_lwp (trap_ptid);
++
++      ptid =3D thread_from_lwp (ptid);
++      if (GET_PID (ptid) =3D=3D -1)
++	ourstatus->kind =3D TARGET_WAITKIND_SPURIOUS;
++    }
+=20
+-  /* Change the ptid back into the higher level PID + TID format.
+-     If the thread is dead and no longer on the thread list, we will=20
+-     get back a dead ptid.  This can occur if the thread death event
+-     gets postponed by other simultaneous events.  In such a case,=20
+-     we want to just ignore the event and continue on.  */
+-  ptid =3D thread_from_lwp (ptid);
+-  if (GET_PID (ptid) =3D=3D -1)
+-    ourstatus->kind =3D TARGET_WAITKIND_SPURIOUS;
+- =20
+   return ptid;
+ }
+=20
+@@ -944,30 +944,6 @@
+ }
+=20
+ static void
+-thread_db_create_inferior (char *exec_file, char *allargs, char **env,
+-			   int from_tty)
+-{
+-  unpush_target (&thread_db_ops);
+-  using_thread_db =3D 0;
+-  target_beneath->to_create_inferior (exec_file, allargs, env, from_tty);
+-}
+-
+-static void
+-thread_db_post_startup_inferior (ptid_t ptid)
+-{
+-  if (proc_handle.pid =3D=3D 0)
+-    {
+-      /* The child process is now the actual multi-threaded
+-         program.  Snatch its process ID...  */
+-      proc_handle.pid =3D GET_PID (ptid);
+-
+-      /* ...and perform the remaining initialization steps.  */
+-      enable_thread_event_reporting ();
+-      thread_db_find_new_threads ();
+-    }
+-}
+-
+-static void
+ thread_db_mourn_inferior (void)
+ {
+   /* Forget about the child's process ID.  We shouldn't need it
+@@ -1002,6 +978,22 @@
+=20
+   ptid =3D ptid_build (GET_PID (inferior_ptid), ti.ti_lid, ti.ti_tid);
+=20
++  if (ti.ti_tid =3D=3D 0)
++    {
++      /* A thread ID of zero means that this is the main thread, but
++	 glibc has not yet initialized thread-local storage and the
++	 pthread library.  We do not know what the thread's TID will
++	 be yet.  Just enable event reporting and otherwise ignore
++	 it.  */
++
++      err =3D td_thr_event_enable_p (th_p, 1);
++      if (err !=3D TD_OK)
++	error (_("Cannot enable thread event reporting for %s: %s"),
++	       target_pid_to_str (ptid), thread_db_err_str (err));
++
++      return 0;
++    }
++
+   if (!in_thread_list (ptid))
+     attach_thread (ptid, th_p, &ti, 1);
+=20
+@@ -1058,6 +1050,16 @@
+   return NULL;
+ }
+=20
++/* Return 1 if this thread has the same LWP as the passed PTID.  */
++
++static int
++same_ptid_callback (struct thread_info *thread, void *arg)
++{
++  ptid_t *ptid_p =3D arg;
++
++  return GET_LWP (thread->ptid) =3D=3D GET_LWP (*ptid_p);
++}
++
+ /* Get the address of the thread local variable in load module LM which
+    is stored at OFFSET within the thread local storage for thread PTID.  =
*/
+=20
+@@ -1066,6 +1068,21 @@
+ 				    CORE_ADDR lm,
+ 				    CORE_ADDR offset)
+ {
++  /* If we have not discovered any threads yet, check now.  */
++  if (!is_thread (ptid) && !have_threads ())
++    thread_db_find_new_threads ();
++
++  /* Try to find a matching thread if we still have the LWP ID instead
++     of the thread ID.  */
++  if (!is_thread (ptid))
++    {
++      struct thread_info *thread;
++
++      thread =3D iterate_over_threads (same_ptid_callback, &ptid);
++      if (thread !=3D NULL)
++	ptid =3D thread->ptid;
++    }
++
+   if (is_thread (ptid))
+     {
+       td_err_e err;
+@@ -1125,14 +1142,11 @@
+   thread_db_ops.to_shortname =3D "multi-thread";
+   thread_db_ops.to_longname =3D "multi-threaded child process.";
+   thread_db_ops.to_doc =3D "Threads and pthreads support.";
+-  thread_db_ops.to_attach =3D thread_db_attach;
+   thread_db_ops.to_detach =3D thread_db_detach;
+   thread_db_ops.to_resume =3D thread_db_resume;
+   thread_db_ops.to_wait =3D thread_db_wait;
+   thread_db_ops.to_xfer_partial =3D thread_db_xfer_partial;
+   thread_db_ops.to_kill =3D thread_db_kill;
+-  thread_db_ops.to_create_inferior =3D thread_db_create_inferior;
+-  thread_db_ops.to_post_startup_inferior =3D thread_db_post_startup_infer=
ior;
+   thread_db_ops.to_mourn_inferior =3D thread_db_mourn_inferior;
+   thread_db_ops.to_find_new_threads =3D thread_db_find_new_threads;
+   thread_db_ops.to_pid_to_str =3D thread_db_pid_to_str;
+Index: gdb/gdbserver/thread-db.c
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- gdb/gdbserver/thread-db.c.orig	2006-10-17 18:02:27.000000000 +0200
++++ gdb/gdbserver/thread-db.c	2008-03-01 14:44:41.000000000 +0100
+@@ -40,6 +40,7 @@
+ /* Connection to the libthread_db library.  */
+ static td_thragent_t *thread_agent;
+=20
++static void thread_db_find_new_threads (void);
+ static int find_new_threads_callback (const td_thrhandle_t *th_p, void *d=
ata);
+=20
+ static char *
+@@ -134,6 +135,8 @@
+   td_event_msg_t msg;
+   td_err_e err;
+   struct inferior_linux_data *tdata;
++  struct thread_info *inferior;
++  struct process_info *process;
+=20
+   if (debug_threads)
+     fprintf (stderr, "Thread creation event.\n");
+@@ -149,6 +152,14 @@
+     fprintf (stderr, "thread getmsg err: %s\n",
+ 	     thread_db_err_str (err));
+=20
++  /* If we do not know about the main thread yet, this would be a good ti=
me to
++     find it.  We need to do this to pick up the main thread before any n=
ewly
++     created threads.  */
++  inferior =3D (struct thread_info *) all_threads.head;
++  process =3D get_thread_process (inferior);
++  if (process->thread_known =3D=3D 0)
++    thread_db_find_new_threads ();
++
+   /* msg.event =3D=3D TD_EVENT_CREATE */
+=20
+   find_new_threads_callback (msg.th_p, NULL);
+@@ -231,8 +242,24 @@
+     {
+       inferior =3D (struct thread_info *) all_threads.head;
+       process =3D get_thread_process (inferior);
++
+       if (process->thread_known =3D=3D 0)
+ 	{
++	  /* If the new thread ID is zero, a final thread ID will be
++	     available later.  Do not enable thread debugging yet.  */
++	  if (ti_p->ti_tid =3D=3D 0)
++	    {
++	      err =3D td_thr_event_enable (th_p, 1);
++	      if (err !=3D TD_OK)
++		error ("Cannot enable thread event reporting for %d: %s",
++		       ti_p->ti_lid, thread_db_err_str (err));
++	      return;
++	    }
++
++	  if (process->lwpid !=3D ti_p->ti_lid)
++	    fatal ("PID mismatch!  Expected %ld, got %ld",
++		   (long) process->lwpid, (long) ti_p->ti_lid);
++
+ 	  /* Switch to indexing the threads list by TID.  */
+ 	  change_inferior_id (&all_threads, ti_p->ti_tid);
+ 	  goto found;
+@@ -331,6 +358,8 @@
+=20
+   process =3D get_thread_process (thread);
+   if (!process->thread_known)
++    thread_db_find_new_threads ();
++  if (!process->thread_known)
+     return TD_NOTHR;
+=20
+   err =3D td_thr_tls_get_addr (&process->th, (psaddr_t) load_module, offs=
et,
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- packages/gdb/gdb-cross-sdk_6.8.bb	9444a910f04467593c5c669381d5ed60212c8=
324
+++ packages/gdb/gdb-cross-sdk_6.8.bb	9444a910f04467593c5c669381d5ed60212c8=
324
@@ -0,0 +1,7 @@
+require gdb-cross.inc
+
+inherit sdk
+
+do_stage() {
+	:
+}
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- packages/gdb/gdb-cross_6.8.bb	0ea423cc4dde24b7f31c9c213c5c9016bcee6ed5
+++ packages/gdb/gdb-cross_6.8.bb	0ea423cc4dde24b7f31c9c213c5c9016bcee6ed5
@@ -0,0 +1,8 @@
+require gdb-cross.inc
+
+SRC_URI +=3D "file://sim-install-6.6.patch;patch=3D1"
+SRC_URI +=3D "file://early_debug_in_nptl.patch;patch=3D1;pnum=3D0"
+
+inherit cross
+
+PR =3D "r1"
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- packages/gdb/gdb_6.8.bb	46a7734cc95c48722b3546e977c35ed0591233c9
+++ packages/gdb/gdb_6.8.bb	46a7734cc95c48722b3546e977c35ed0591233c9
@@ -0,0 +1,3 @@
+require gdb.inc
+
+PR =3D "r1"


--=-RSa7KWkz3RmC3QZ5zNSo
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQBH/b/uHnJKy6V6em4RAglDAJ4yrM4RgVp118FIl+V4AnTuSnDlKQCeOuKL
pjmECGeOJi6o270LjcSqKls=
=gum/
-----END PGP SIGNATURE-----

--=-RSa7KWkz3RmC3QZ5zNSo--
