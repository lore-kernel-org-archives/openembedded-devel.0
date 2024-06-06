Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EDDAC27C55
	for <webhook@archiver.kernel.org>; Thu,  6 Jun 2024 16:23:24 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.18983.1717690997167390750
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Jun 2024 09:23:17 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=688773d3a7=kai.kang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 456Ba3g5029696
	for <openembedded-devel@lists.openembedded.org>; Thu, 6 Jun 2024 16:23:16 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3yftm7wg5f-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 06 Jun 2024 16:23:15 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 6 Jun 2024 09:23:14 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Thu, 6 Jun 2024 09:23:14 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH 2/4] uw-imap: fix compile errors of incompatible pointer type
Date: Fri, 7 Jun 2024 00:23:05 +0800
Message-ID: <20240606162307.972946-2-kai.kang@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240606162307.972946-1-kai.kang@windriver.com>
References: <20240606162307.972946-1-kai.kang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: dJ8Qg44GE9N4QaRdfJOgnua0AskKLPGI
X-Proofpoint-ORIG-GUID: dJ8Qg44GE9N4QaRdfJOgnua0AskKLPGI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-06_01,2024-06-06_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 phishscore=0 suspectscore=0 mlxscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2405170001 definitions=main-2406060118
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Jun 2024 16:23:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110750

From: Kai Kang <kai.kang@windriver.com>

Fix compile errors when gcc option '-Wincompatible-pointer-types' set:

mx.c: In function 'mx_setdate':
mx.c:1286:15: error: passing argument 2 of 'utime' from incompatible pointer type [-Wincompatible-pointer-types]
 1286 |   utime (file,tp);              /* set the times */
      |               ^~
      |               |
      |               time_t * {aka long int *}

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 ...-imap-fix-incompatible-pointer-types.patch | 354 ++++++++++++++++++
 .../recipes-devtools/uw-imap/uw-imap_2007f.bb |   1 +
 2 files changed, 355 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/uw-imap/uw-imap/uw-imap-fix-incompatible-pointer-types.patch

diff --git a/meta-oe/recipes-devtools/uw-imap/uw-imap/uw-imap-fix-incompatible-pointer-types.patch b/meta-oe/recipes-devtools/uw-imap/uw-imap/uw-imap-fix-incompatible-pointer-types.patch
new file mode 100644
index 000000000..7146fbbeb
--- /dev/null
+++ b/meta-oe/recipes-devtools/uw-imap/uw-imap/uw-imap-fix-incompatible-pointer-types.patch
@@ -0,0 +1,354 @@
+Fix compile errors when gcc option '-Wincompatible-pointer-types' set:
+
+mx.c: In function 'mx_setdate':
+mx.c:1286:15: error: passing argument 2 of 'utime' from incompatible pointer type [-Wincompatible-pointer-types]
+ 1286 |   utime (file,tp);              /* set the times */
+      |               ^~
+      |               |
+      |               time_t * {aka long int *}
+
+
+Upstream-Status: Pending
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+---
+ src/osdep/unix/mbx.c       |  12 ++++++------
+ src/osdep/unix/mh.c        |   2 +-
+ src/osdep/unix/mmdf.c      |  10 +++++-----
+ src/osdep/unix/mtx.c       |  16 ++++++++--------
+ src/osdep/unix/mx.c        |   2 +-
+ src/osdep/unix/tenex.c     |  16 ++++++++--------
+ src/osdep/unix/unix.c      |  10 +++++-----
+ 7 files changed, 34 insertions(+), 34 deletions(-)
+
+diff --git a/src/osdep/unix/mbx.c b/src/osdep/unix/mbx.c
+index c8a45a5..0a587fe 100644
+--- a/src/osdep/unix/mbx.c
++++ b/src/osdep/unix/mbx.c
+@@ -302,7 +302,7 @@ int mbx_isvalid (MAILSTREAM **stream,char *name,char *tmp,int *ld,char *lock,
+     if (sbuf.st_ctime > sbuf.st_atime) {
+       tp[0] = sbuf.st_atime;	/* preserve atime and mtime */
+       tp[1] = sbuf.st_mtime;
+-      utime (tmp,tp);		/* set the times */
++      utime (tmp, (const struct utimbuf *)tp);		/* set the times */
+     }
+   }
+ 				/* in case INBOX but not mbx format */
+@@ -776,7 +776,7 @@ void mbx_flag (MAILSTREAM *stream,char *sequence,char *flag,long flags)
+ 	 stream->user_flags[LOCAL->ffuserflag]) || (oldpid != LOCAL->lastpid))
+       mbx_update_header (stream);
+     tp[0] = time (0);		/* make sure read comes after all that */
+-    utime (stream->mailbox,tp);
++    utime (stream->mailbox, (const struct utimbuf *)tp);
+   }
+   if (LOCAL->ld >= 0) {		/* unlock now */
+     unlockfd (LOCAL->ld,LOCAL->lock);
+@@ -1075,7 +1075,7 @@ long mbx_copy (MAILSTREAM *stream,char *sequence,char *mailbox,long options)
+ 				/* else preserve \Marked status */
+   else tp[0] = (sbuf.st_ctime > sbuf.st_atime) ? sbuf.st_atime : time(0);
+   tp[1] = sbuf.st_mtime;	/* preserve mtime */
+-  utime (file,tp);		/* set the times */
++  utime (file, (const struct utimbuf *)tp);		/* set the times */
+   close (fd);			/* close the file */
+   MM_NOCRITICAL (stream);	/* release critical */
+   unlockfd (ld,lock);		/* release exclusive parse/append permission */
+@@ -1213,7 +1213,7 @@ long mbx_append (MAILSTREAM *stream,char *mailbox,append_t af,void *data)
+ 				/* else preserve \Marked status */
+     else tp[0] = (sbuf.st_ctime > sbuf.st_atime) ? sbuf.st_atime : time(0);
+     tp[1] = sbuf.st_mtime;	/* preserve mtime */
+-    utime (file,tp);		/* set the times */
++    utime (file, (const struct utimbuf *)tp);		/* set the times */
+     fclose (df);		/* close the file */
+     MM_NOCRITICAL (dstream);	/* release critical */
+   }
+@@ -1446,7 +1446,7 @@ long mbx_parse (MAILSTREAM *stream)
+     time_t tp[2];
+     tp[0] = time (0);
+     tp[1] = LOCAL->filetime;
+-    utime (stream->mailbox,tp);
++    utime (stream->mailbox, (const struct utimbuf *)tp);
+   }
+   stream->silent = silent;	/* can pass up events now */
+   mail_exists (stream,nmsgs);	/* notify upper level of new mailbox size */
+@@ -1814,7 +1814,7 @@ unsigned long mbx_rewrite (MAILSTREAM *stream,unsigned long *reclaimed,
+   fstat (LOCAL->fd,&sbuf);	/* get new write time */
+   tp[1] = LOCAL->filetime = sbuf.st_mtime;
+   tp[0] = time (0);		/* reset atime to now */
+-  utime (stream->mailbox,tp);
++  utime (stream->mailbox, (const struct utimbuf *)tp);
+   unlockfd (ld,lock);		/* release exclusive parse/append permission */
+ 				/* notify upper level of new mailbox size */
+   mail_exists (stream,stream->nmsgs);
+diff --git a/src/osdep/unix/mh.c b/src/osdep/unix/mh.c
+index 9264624..26f3539 100644
+--- a/src/osdep/unix/mh.c
++++ b/src/osdep/unix/mh.c
+@@ -1279,5 +1279,5 @@ void mh_setdate (char *file,MESSAGECACHE *elt)
+   time_t tp[2];
+   tp[0] = time (0);		/* atime is now */
+   tp[1] = mail_longdate (elt);	/* modification time */
+-  utime (file,tp);		/* set the times */
++  utime (file, (const struct utimbuf *)tp);		/* set the times */
+ }
+diff --git a/src/osdep/unix/mmdf.c b/src/osdep/unix/mmdf.c
+index e962434..c0adbee 100644
+--- a/src/osdep/unix/mmdf.c
++++ b/src/osdep/unix/mmdf.c
+@@ -379,7 +379,7 @@ long mmdf_isvalid (char *name,char *tmp)
+       if ((sbuf.st_ctime > sbuf.st_atime) || (sbuf.st_mtime > sbuf.st_atime)) {
+ 	tp[0] = sbuf.st_atime;	/* preserve atime and mtime */
+ 	tp[1] = sbuf.st_mtime;
+-	utime (file,tp);	/* set the times */
++	utime (file, (const struct utimbuf *)tp);	/* set the times */
+       }
+     }
+   }
+@@ -1131,7 +1131,7 @@ long mmdf_copy (MAILSTREAM *stream,char *sequence,char *mailbox,long options)
+   else tp[0] =			/* else preserve \Marked status */
+ 	 ((sbuf.st_ctime > sbuf.st_atime) || (sbuf.st_mtime > sbuf.st_atime)) ?
+ 	 sbuf.st_atime : tp[1];
+-  utime (file,tp);		/* set the times */
++  utime (file, (const struct utimbuf *)tp);		/* set the times */
+   mmdf_unlock (fd,NIL,&lock);	/* unlock and close mailbox */
+   if (tstream) {		/* update last UID if we can */
+     MMDFLOCAL *local = (MMDFLOCAL *) tstream->local;
+@@ -1292,7 +1292,7 @@ long mmdf_append (MAILSTREAM *stream,char *mailbox,append_t af,void *data)
+     ret = NIL;			/* return error */
+   }
+   else tp[0] = tp[1] - 1;	/* set atime to now-1 if successful copy */
+-  utime (file,tp);		/* set the times */
++  utime (file, (const struct utimbuf *)tp);		/* set the times */
+   fclose (sf);			/* done with scratch file */
+ 				/* force UIDVALIDITY assignment now */
+   if (tstream && !tstream->uid_validity) tstream->uid_validity = time (0);
+@@ -1550,7 +1550,7 @@ void mmdf_unlock (int fd,MAILSTREAM *stream,DOTLOCK *lock)
+     }
+     else now = 0;		/* no time change needed */
+ 				/* set the times, note change */
+-    if (now && !utime (stream->mailbox,tp)) LOCAL->filetime = tp[1];
++    if (now && !utime (stream->mailbox, (const struct utimbuf *)tp)) LOCAL->filetime = tp[1];
+   }
+   flock (fd,LOCK_UN);		/* release flock'ers */
+   if (!stream) close (fd);	/* close the file if no stream */
+@@ -2393,7 +2393,7 @@ long mmdf_rewrite (MAILSTREAM *stream,unsigned long *nexp,DOTLOCK *lock,
+ 				/* set atime to now, mtime a second earlier */
+     tp[1] = (tp[0] = time (0)) - 1;
+ 				/* set the times, note change */
+-    if (!utime (stream->mailbox,tp)) LOCAL->filetime = tp[1];
++    if (!utime (stream->mailbox, (const struct utimbuf *)tp)) LOCAL->filetime = tp[1];
+     close (LOCAL->fd);		/* close and reopen file */
+     if ((LOCAL->fd = open (stream->mailbox,O_RDWR,
+ 			   (long) mail_parameters (NIL,GET_MBXPROTECTION,NIL)))
+diff --git a/src/osdep/unix/mtx.c b/src/osdep/unix/mtx.c
+index 8e6f76e..f64142b 100644
+--- a/src/osdep/unix/mtx.c
++++ b/src/osdep/unix/mtx.c
+@@ -196,7 +196,7 @@ int mtx_isvalid (char *name,char *tmp)
+       if (sbuf.st_ctime > sbuf.st_atime) {
+ 	tp[0] = sbuf.st_atime;	/* preserve atime and mtime */
+ 	tp[1] = sbuf.st_mtime;
+-	utime (file,tp);	/* set the times */
++	utime (file, (const struct utimbuf *)tp);	/* set the times */
+       }
+     }
+   }
+@@ -565,7 +565,7 @@ void mtx_flag (MAILSTREAM *stream,char *sequence,char *flag,long flags)
+     fstat (LOCAL->fd,&sbuf);	/* get current write time */
+     tp[1] = LOCAL->filetime = sbuf.st_mtime;
+     tp[0] = time (0);		/* make sure read comes after all that */
+-    utime (stream->mailbox,tp);
++    utime (stream->mailbox, (const struct utimbuf *)tp);
+   }
+ }
+ 
+@@ -834,7 +834,7 @@ long mtx_expunge (MAILSTREAM *stream,char *sequence,long options)
+       fstat (LOCAL->fd,&sbuf);	/* get new write time */
+       tp[1] = LOCAL->filetime = sbuf.st_mtime;
+       tp[0] = time (0);		/* reset atime to now */
+-      utime (stream->mailbox,tp);
++      utime (stream->mailbox, (const struct utimbuf *)tp);
+       MM_NOCRITICAL (stream);	/* release critical */
+ 				/* notify upper level of new mailbox size */
+       mail_exists (stream,stream->nmsgs);
+@@ -929,7 +929,7 @@ long mtx_copy (MAILSTREAM *stream,char *sequence,char *mailbox,long options)
+ 				/* else preserve \Marked status */
+   else tp[0] = (sbuf.st_ctime > sbuf.st_atime) ? sbuf.st_atime : time(0);
+   tp[1] = sbuf.st_mtime;	/* preserve mtime */
+-  utime (file,tp);		/* set the times */
++  utime (file, (const struct utimbuf *)tp);		/* set the times */
+   close (fd);			/* close the file */
+   unlockfd (ld,lock);		/* release exclusive parse/append permission */
+   MM_NOCRITICAL (stream);	/* release critical */
+@@ -946,7 +946,7 @@ long mtx_copy (MAILSTREAM *stream,char *sequence,char *mailbox,long options)
+       fstat (LOCAL->fd,&sbuf);	/* get current write time */
+       tp[1] = LOCAL->filetime = sbuf.st_mtime;
+       tp[0] = time (0);		/* make sure atime remains greater */
+-      utime (stream->mailbox,tp);
++      utime (stream->mailbox, (const struct utimbuf *)tp);
+     }
+   }
+   if (ret && mail_parameters (NIL,GET_COPYUID,NIL))
+@@ -1062,7 +1062,7 @@ long mtx_append (MAILSTREAM *stream,char *mailbox,append_t af,void *data)
+ 				/* else preserve \Marked status */
+   else tp[0] = (sbuf.st_ctime > sbuf.st_atime) ? sbuf.st_atime : time(0);
+   tp[1] = sbuf.st_mtime;	/* preserve mtime */
+-  utime (file,tp);		/* set the times */
++  utime (file, (const struct utimbuf *)tp);		/* set the times */
+   fclose (df);			/* close the file */
+   unlockfd (ld,lock);		/* release exclusive parse/append permission */
+   MM_NOCRITICAL (stream);	/* release critical */
+@@ -1212,7 +1212,7 @@ long mtx_parse (MAILSTREAM *stream)
+     time_t tp[2];
+     tp[0] = time (0);
+     tp[1] = LOCAL->filetime;
+-    utime (stream->mailbox,tp);
++    utime (stream->mailbox, (const struct utimbuf *)tp);
+   }
+   stream->silent = silent;	/* can pass up events now */
+   mail_exists (stream,nmsgs);	/* notify upper level of new mailbox size */
+@@ -1312,7 +1312,7 @@ void mtx_update_status (MAILSTREAM *stream,unsigned long msgno,long syncflag)
+       fstat (LOCAL->fd,&sbuf);	/* get new write time */
+       tp[1] = LOCAL->filetime = sbuf.st_mtime;
+       tp[0] = time (0);		/* make sure read is later */
+-      utime (stream->mailbox,tp);
++      utime (stream->mailbox, (const struct utimbuf *)tp);
+     }
+   }
+ }
+diff --git a/src/osdep/unix/mx.c b/src/osdep/unix/mx.c
+index b5c5adf..4146409 100644
+--- a/src/osdep/unix/mx.c
++++ b/src/osdep/unix/mx.c
+@@ -1283,5 +1283,5 @@ void mx_setdate (char *file,MESSAGECACHE *elt)
+   time_t tp[2];
+   tp[0] = time (0);		/* atime is now */
+   tp[1] = mail_longdate (elt);	/* modification time */
+-  utime (file,tp);		/* set the times */
++  utime (file, (const struct utimbuf *)tp);		/* set the times */
+ }
+diff --git a/src/osdep/unix/tenex.c b/src/osdep/unix/tenex.c
+index eee61fb..622da61 100644
+--- a/src/osdep/unix/tenex.c
++++ b/src/osdep/unix/tenex.c
+@@ -203,7 +203,7 @@ int tenex_isvalid (char *name,char *tmp)
+       if (sbuf.st_ctime > sbuf.st_atime) {
+ 	tp[0] = sbuf.st_atime;	/* preserve atime and mtime */
+ 	tp[1] = sbuf.st_mtime;
+-	utime (file,tp);	/* set the times */
++	utime (file, (const struct utimbuf *)tp);	/* set the times */
+       }
+     }
+   }
+@@ -654,7 +654,7 @@ void tenex_flag (MAILSTREAM *stream,char *sequence,char *flag,long flags)
+     fstat (LOCAL->fd,&sbuf);	/* get current write time */
+     tp[1] = LOCAL->filetime = sbuf.st_mtime;
+     tp[0] = time (0);		/* make sure read comes after all that */
+-    utime (stream->mailbox,tp);
++    utime (stream->mailbox, (const struct utimbuf *)tp);
+   }
+ }
+ 
+@@ -924,7 +924,7 @@ long tenex_expunge (MAILSTREAM *stream,char *sequence,long options)
+       fstat (LOCAL->fd,&sbuf);	/* get new write time */
+       tp[1] = LOCAL->filetime = sbuf.st_mtime;
+       tp[0] = time (0);		/* reset atime to now */
+-      utime (stream->mailbox,tp);
++      utime (stream->mailbox, (const struct utimbuf *)tp);
+       MM_NOCRITICAL (stream);	/* release critical */
+ 				/* notify upper level of new mailbox size */
+       mail_exists (stream,stream->nmsgs);
+@@ -1019,7 +1019,7 @@ long tenex_copy (MAILSTREAM *stream,char *sequence,char *mailbox,long options)
+ 				/* else preserve \Marked status */
+   else tp[0] = (sbuf.st_ctime > sbuf.st_atime) ? sbuf.st_atime : time(0);
+   tp[1] = sbuf.st_mtime;	/* preserve mtime */
+-  utime (file,tp);		/* set the times */
++  utime (file, (const struct utimbuf *)tp);		/* set the times */
+   close (fd);			/* close the file */
+   unlockfd (ld,lock);		/* release exclusive parse/append permission */
+   MM_NOCRITICAL (stream);	/* release critical */
+@@ -1036,7 +1036,7 @@ long tenex_copy (MAILSTREAM *stream,char *sequence,char *mailbox,long options)
+       fstat (LOCAL->fd,&sbuf);	/* get current write time */
+       tp[1] = LOCAL->filetime = sbuf.st_mtime;
+       tp[0] = time (0);		/* make sure atime remains greater */
+-      utime (stream->mailbox,tp);
++      utime (stream->mailbox, (const struct utimbuf *)tp);
+     }
+   }
+   if (ret && mail_parameters (NIL,GET_COPYUID,NIL))
+@@ -1159,7 +1159,7 @@ long tenex_append (MAILSTREAM *stream,char *mailbox,append_t af,void *data)
+ 				/* else preserve \Marked status */
+   else tp[0] = (sbuf.st_ctime > sbuf.st_atime) ? sbuf.st_atime : time(0);
+   tp[1] = sbuf.st_mtime;	/* preserve mtime */
+-  utime (file,tp);		/* set the times */
++  utime (file, (const struct utimbuf *)tp);		/* set the times */
+   fclose (df);			/* close the file */
+   unlockfd (ld,lock);		/* release exclusive parse/append permission */
+   MM_NOCRITICAL (stream);	/* release critical */
+@@ -1324,7 +1324,7 @@ long tenex_parse (MAILSTREAM *stream)
+     time_t tp[2];
+     tp[0] = time (0);
+     tp[1] = LOCAL->filetime;
+-    utime (stream->mailbox,tp);
++    utime (stream->mailbox, (const struct utimbuf *)tp);
+   }
+   stream->silent = silent;	/* can pass up events now */
+   mail_exists (stream,nmsgs);	/* notify upper level of new mailbox size */
+@@ -1424,7 +1424,7 @@ void tenex_update_status (MAILSTREAM *stream,unsigned long msgno,long syncflag)
+       fstat (LOCAL->fd,&sbuf);	/* get new write time */
+       tp[1] = LOCAL->filetime = sbuf.st_mtime;
+       tp[0] = time (0);		/* make sure read is later */
+-      utime (stream->mailbox,tp);
++      utime (stream->mailbox, (const struct utimbuf *)tp);
+     }
+   }
+ }
+diff --git a/src/osdep/unix/unix.c b/src/osdep/unix/unix.c
+index 86be3f9..012dc83 100644
+--- a/src/osdep/unix/unix.c
++++ b/src/osdep/unix/unix.c
+@@ -232,7 +232,7 @@ DRIVER *unix_valid (char *name)
+       if ((sbuf.st_ctime > sbuf.st_atime) || (sbuf.st_mtime > sbuf.st_atime)) {
+ 	tp[0] = sbuf.st_atime;	/* yes, preserve atime and mtime */
+ 	tp[1] = sbuf.st_mtime;
+-	utime (file,tp);	/* set the times */
++	utime (file, (const struct utimbuf *)tp);	/* set the times */
+       }
+     }
+   }
+@@ -999,7 +999,7 @@ long unix_copy (MAILSTREAM *stream,char *sequence,char *mailbox,long options)
+   else tp[0] =			/* else preserve \Marked status */
+ 	 ((sbuf.st_ctime > sbuf.st_atime) || (sbuf.st_mtime > sbuf.st_atime)) ?
+ 	 sbuf.st_atime : tp[1];
+-  utime (file,tp);		/* set the times */
++  utime (file, (const struct utimbuf *)tp);		/* set the times */
+   unix_unlock (fd,NIL,&lock);	/* unlock and close mailbox */
+   if (tstream) {		/* update last UID if we can */
+     UNIXLOCAL *local = (UNIXLOCAL *) tstream->local;
+@@ -1160,7 +1160,7 @@ long unix_append (MAILSTREAM *stream,char *mailbox,append_t af,void *data)
+     ret = NIL;			/* return error */
+   }
+   else tp[0] = tp[1] - 1;	/* set atime to now-1 if successful copy */
+-  utime (file,tp);		/* set the times */
++  utime (file, (const struct utimbuf *)tp);		/* set the times */
+   fclose (sf);			/* done with scratch file */
+ 				/* force UIDVALIDITY assignment now */
+   if (tstream && !tstream->uid_validity) tstream->uid_validity = time (0);
+@@ -1425,7 +1425,7 @@ void unix_unlock (int fd,MAILSTREAM *stream,DOTLOCK *lock)
+     }
+     else now = 0;		/* no time change needed */
+ 				/* set the times, note change */
+-    if (now && !utime (stream->mailbox,tp)) LOCAL->filetime = tp[1];
++    if (now && !utime (stream->mailbox, (const struct utimbuf *)tp)) LOCAL->filetime = tp[1];
+   }
+   flock (fd,LOCK_UN);		/* release flock'ers */
+   if (!stream) close (fd);	/* close the file if no stream */
+@@ -2251,7 +2251,7 @@ long unix_rewrite (MAILSTREAM *stream,unsigned long *nexp,DOTLOCK *lock,
+ 				/* set atime to now, mtime a second earlier */
+     tp[1] = (tp[0] = time (0)) - 1;
+ 				/* set the times, note change */
+-    if (!utime (stream->mailbox,tp)) LOCAL->filetime = tp[1];
++    if (!utime (stream->mailbox, (const struct utimbuf *)tp)) LOCAL->filetime = tp[1];
+     close (LOCAL->fd);		/* close and reopen file */
+     if ((LOCAL->fd = open (stream->mailbox,O_RDWR,
+ 			   (long) mail_parameters (NIL,GET_MBXPROTECTION,NIL)))
diff --git a/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb b/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb
index 17faa3aa6..7e3bddb58 100644
--- a/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb
+++ b/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb
@@ -16,6 +16,7 @@ SRC_URI = "https://fossies.org/linux/misc/old/imap-${PV}.tar.gz \
            file://0002-tmail-Include-ctype.h-for-isdigit.patch \
            file://0001-Fix-Wincompatible-function-pointer-types.patch \
            file://uw-imap-newer-tls.patch \
+           file://uw-imap-fix-incompatible-pointer-types.patch \
            "
 
 SRC_URI[md5sum] = "2126fd125ea26b73b20f01fcd5940369"
-- 
2.34.1


