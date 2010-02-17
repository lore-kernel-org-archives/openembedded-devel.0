Received: from mail-yw0-f178.google.com ([209.85.211.178])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vivektambakad@gmail.com>) id 1Nhg8v-0006Rx-1k
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Feb 2010 10:24:28 +0100
Received: by ywh8 with SMTP id 8so3999978ywh.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Feb 2010 01:21:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=a3TJ8Z5a1tYtP2nRFlUvdWvbr0nWXLuvTA1IsCz2Xwg=;
	b=DLyiDHgsJYrPZOEAC9Q+psA9iXKTI3f4CpCnUfGZqL7WtIihoRufg91NU+WzTL4Kc4
	SXBUvJ4ArI2Yj51CoH2FXOtFWvFUGbah45ALqtrzpnfEPE4Va+Fm5H03578vaIDQm+O8
	k3F5Abp7OLZo6oWuMXk39gf9UEg1EhBcs5G7A=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=OUHuFZfKSZbPyZop2ZlNYkwDyxCy6oF1xZZ3PnoZuVw3xXlaYV/Of6TSdYe+Yj1ihk
	2Df6uDPs165E91KLnFmgmXKK5lkgMUtv6olbnIzEOdZL8mW2Fha/5vaCI5aba8MyCbFl
	/RUf1lz/qMH9w1nZVzoQeKy4n1oXC6Ec477Fk=
MIME-Version: 1.0
Received: by 10.90.245.1 with SMTP id s1mr3068250agh.72.1266398482944; Wed, 17 
	Feb 2010 01:21:22 -0800 (PST)
Date: Wed, 17 Feb 2010 14:51:22 +0530
Message-ID: <ad82c8891002170121n731f8ec4i20249eca9c4dc149@mail.gmail.com>
From: vivek tambakad <vivektambakad@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.211.178
X-SA-Exim-Mail-From: vivektambakad@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Build error with openmoko and minimo bitbake files
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
X-List-Received-Date: Wed, 17 Feb 2010 09:24:29 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,
        I am building "bitbake x11-image" for compulab Em-x270. I am getting
error in openmoko and minimo bitbake files.
Please help me in building image. The error is as follows:

ERROR: Error in executing:
/home/vivek/development/em-x270/stuff//openembedded/recipes/openmoko2/
openmoko-dialer2_svn.bb
ERROR: Exception:<type 'exceptions.ValueError'> Message:need more than 1
value to unpack
ERROR: Printing the environment of the function
ERROR:     0001:def do_package_ipk():
ERROR:     0002:    import re, copy
ERROR:     0003:
ERROR:     0004:    workdir = bb.data.getVar('WORKDIR', d, 1)
ERROR:     0005:    if not workdir:
ERROR:     0006:        bb.error("WORKDIR not defined, unable to package")
ERROR: Error in executing:
/home/vivek/development/em-x270/stuff//openembedded/recipes/openmoko2/
openmoko-dialer2_svn.bb
ERROR: Exception:<type 'exceptions.ValueError'> Message:need more than 1
value to unpack
ERROR: Printing the environment of the function
ERROR:     0001:def do_package_write_ipk():
ERROR:     0002:    packages = bb.data.getVar('PACKAGES', d, True)
ERROR:     0003:    if not packages:
ERROR:     0004:        bb.debug(1, "No PACKAGES defined, nothing to
package")
ERROR:     0005:        return
ERROR:     0006:
ERROR: Build of
/home/vivek/development/em-x270/stuff//openembedded/recipes/openmoko2/
openmoko-dialer2_svn.bb do_package_write_ipk failed
ERROR: Task 2533
(/home/vivek/development/em-x270/stuff//openembedded/recipes/openmoko2/
libmokojournal2_svn.bb, do_package_write_ipk) failed

NOTE: Task failed:
/home/vivek/development/em-x270/stuff/build/oetmp/work/armv5te-angstrom-linux-gnueabi/minimo-1_0.02+cvs20070626-r1/temp/log.do_configure.32350
ERROR: TaskFailed event exception, aborting
ERROR: Build of
/home/vivek/development/em-x270/stuff//openembedded/recipes/mozilla/
minimo_cvs.bb do_configure failed
ERROR: Task 363
(/home/vivek/development/em-x270/stuff//openembedded/recipes/mozilla/
minimo_cvs.bb, do_configure) failed
NOTE: Tasks Summary: Attempted 4948 tasks of which 4947 didn't need to be
rerun and 3 failed.
ERROR:
'/home/vivek/development/em-x270/stuff//openembedded/recipes/openmoko2/
libmokojournal2_svn.bb' failed
ERROR:
'/home/vivek/development/em-x270/stuff//openembedded/recipes/openmoko2/
openmoko-dialer2_svn.bb' failed
ERROR: '/home/vivek/development/em-x270/stuff//openembedded/recipes/mozilla/
minimo_cvs.bb' failed

with regards
vivek tambakad

