Received: from mail-pw0-f53.google.com ([209.85.160.53])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vivektambakad@gmail.com>) id 1NIcG2-00009P-46
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Dec 2009 07:12:13 +0100
Received: by pwi18 with SMTP id 18so261368pwi.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Dec 2009 22:10:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=DxnUG48sYSaMUYXTA0MKC3meGYme5iPR4DhWTzQFxRg=;
	b=OQMmKLg8O4P7ielIK5KlIw3aARJWCPihsWLx5fY1IBLvoVvqjTGvCgZ+UFxHP0XNvs
	/5kDWzlvX3pJCXBG/gPW3Q+swrMe/IXASqYvdm+yxnTsz/fFABwoewxJXE9Rl/HkmM29
	GhC2+iNY+mKKob5X9ET4TAya4G6nuTt9AosoE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=NVQpgZPrrgHnrM2fKQuc6VAw/p4g6+ifN+tFiv7ETbz3D2womr0ozZk1C2V7rgMBqp
	w2ENpBIAznR8gPKSK8OjQDUCT8QY1bEJMcWHEYq50vLgDi1V5fOshPGQ/jmwnUiMonCz
	DA3cRr11eLfgF5StZUtuVSOM/Oz461p7QNc6E=
MIME-Version: 1.0
Received: by 10.115.38.40 with SMTP id q40mr5322857waj.95.1260425422473; Wed, 
	09 Dec 2009 22:10:22 -0800 (PST)
Date: Thu, 10 Dec 2009 11:40:22 +0530
Message-ID: <ad82c8890912092210n31557da0lc913dcc16261d883@mail.gmail.com>
From: vivek tambakad <vivektambakad@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.53
X-SA-Exim-Mail-From: vivektambakad@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Build error while using bitabake linphone
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 10 Dec 2009 06:12:13 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi
       When i am compiling linphone it shows the following GTK error.

 checking for LIBGTK... configure: error: Package requirements (gtk+-2.0 >=
2.4.0 gthread-2.0) were not met:
|
| No package 'gtk+-2.0' found
|
| Consider adjusting the PKG_CONFIG_PATH environment variable if you
| installed software in a non-standard prefix.
|
| Alternatively, you may set the environment variables LIBGTK_CFLAGS
| and LIBGTK_LIBS to avoid the need to call pkg-config.
| See the pkg-config man page for more details.
|
| FATAL: oe_runconf failed
NOTE: Task failed:
/home/vivek/development/em-x270/stuff/build/oetmp/work/armv5te-angstrom-linux-gnueabi/linphone-3.1.0-r1/temp/log.do_configure.15159
ERROR: TaskFailed event exception, aborting
ERROR: Build of
/home/vivek/development/em-x270/stuff//openembedded/recipes/linphone/
linphone_3.1.0.bb do_configure failed
ERROR: Task 5
(/home/vivek/development/em-x270/stuff//openembedded/recipes/linphone/
linphone_3.1.0.bb, do_configure) failed
NOTE: Tasks Summary: Attempted 644 tasks of which 644 didn't need to be
rerun and 1 failed.
ERROR:
'/home/vivek/development/em-x270/stuff//openembedded/recipes/linphone/
linphone_3.1.0.bb' failed

Please tell what changes i have to make in linphone bitbake file so that it
works fine.

with regards
vivek tambakad

