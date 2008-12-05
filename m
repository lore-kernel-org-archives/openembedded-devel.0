Received: from [209.85.200.169] (helo=wf-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1L8gW9-0003S8-H2
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Dec 2008 20:39:13 +0100
Received: by wf-out-1314.google.com with SMTP id 29so137787wff.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Dec 2008 11:35:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:mime-version:content-type:content-disposition:user-agent;
	bh=YCzG2sRFRZLWZJe1ENyR81/nNijlmvpbkI8ADx8PGUk=;
	b=AyFLDkbjSpOHKMtOMJnKPRlMHAgNCWqXC+uqj4vm2CtFs+I5iASE6lRzRhwl18NfUY
	DAH9tpPL2bIufqXU9DkfgVrrEfJd8+7t7g0d1cDIaiavYk6rg8VArb4b9vmALeItam2t
	YOwr46tnVhkGR1GhZIpoidsLME0t+Kw9Rt774=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	b=LYVOxTxhywLuQHVtuJWgnoYzmzmOaQ747vfo3AwQDqF4q8lOFs8VQXQj9zZV0vFjbG
	HBYyB9Z5HjNqStF/IUiLfg979prsNmj24wE7y41lpUl56rlC7vSEVptAEILsEvBFJfZ3
	mRsoFV/XBJvKDPyrVn8XVMwiZxKgwQaQwbZZo=
Received: by 10.114.192.3 with SMTP id p3mr321917waf.25.1228505733093;
	Fri, 05 Dec 2008 11:35:33 -0800 (PST)
Received: from localhost (adsl-71-146-4-209.dsl.pltn13.sbcglobal.net
	[71.146.4.209])
	by mx.google.com with ESMTPS id z15sm14449997pod.27.2008.12.05.11.35.32
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 05 Dec 2008 11:35:32 -0800 (PST)
Date: Fri, 5 Dec 2008 11:35:31 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20081205193531.GA28189@gmail.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.17+20080114 (2008-01-14)
Subject: disable hash-style=gnu for mips machines
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
X-List-Received-Date: Fri, 05 Dec 2008 19:39:14 -0000
X-Groupsio-MsgNum: 6873
Content-Type: multipart/mixed; boundary="7AUc2qLy4jB3hD7Z"
Content-Disposition: inline

--7AUc2qLy4jB3hD7Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi

mips dynamic section is not compatible with gnu hash style there we need
to disable this option when building for mips targets. Attached patch
(tested on eglibc) fixes the problem.

OK for dev ?

Thanks

-Khem


--7AUc2qLy4jB3hD7Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=patch

diff --git a/conf/distro/include/angstrom-eglibc.inc b/conf/distro/include/angstrom-eglibc.inc
index 1d38e5f..c0d87a4 100644
--- a/conf/distro/include/angstrom-eglibc.inc
+++ b/conf/distro/include/angstrom-eglibc.inc
@@ -29,7 +29,7 @@ BUILD_OPTIMIZATION = "-Os"
 BUILD_OPTIMIZATION_pn-perl = "-O1"
 BUILD_OPTIMIZATION_sparc = "-O2"
 
-TARGET_LINK_HASH_STYLE = "-Wl,--hash-style=gnu"
+TARGET_LINK_HASH_STYLE = "${@['-Wl,--hash-style=gnu',''][bb.data.getVar('TARGET_ARCH',d,1) in ['mips', 'mipsel']]}"
 
 CXXFLAGS += "-fvisibility-inlines-hidden"
 
diff --git a/conf/distro/include/angstrom-glibc.inc b/conf/distro/include/angstrom-glibc.inc
index fdb59f3..b14f880 100644
--- a/conf/distro/include/angstrom-glibc.inc
+++ b/conf/distro/include/angstrom-glibc.inc
@@ -33,7 +33,7 @@ BUILD_OPTIMIZATION_pn-perl = "-O1"
 BUILD_OPTIMIZATION_pn-glibc = "-O2"
 BUILD_OPTIMIZATION_sparc = "-O2"
 
-TARGET_LINK_HASH_STYLE = "-Wl,--hash-style=gnu"
+TARGET_LINK_HASH_STYLE = "${@['-Wl,--hash-style=gnu',''][bb.data.getVar('TARGET_ARCH',d,1) in ['mips', 'mipsel']]}"
 
 CXXFLAGS += "-fvisibility-inlines-hidden"
 
diff --git a/conf/distro/include/angstrom-uclibc.inc b/conf/distro/include/angstrom-uclibc.inc
index 8383ddc..71b8862 100644
--- a/conf/distro/include/angstrom-uclibc.inc
+++ b/conf/distro/include/angstrom-uclibc.inc
@@ -33,7 +33,7 @@ BUILD_OPTIMIZATION = "-Os"
 #Note that this testing was done without the gcc-pr32889.patch.
 FULL_OPTIMIZATION_avr32 = "-Os -fomit-frame-pointer"
 
-TARGET_LINK_HASH_STYLE = "-Wl,--hash-style=gnu"
+TARGET_LINK_HASH_STYLE = "${@['-Wl,--hash-style=gnu',''][bb.data.getVar('TARGET_ARCH',d,1) in ['mips', 'mipsel']]}"
 
 CXXFLAGS += "-fvisibility-inlines-hidden"
 

--7AUc2qLy4jB3hD7Z--
