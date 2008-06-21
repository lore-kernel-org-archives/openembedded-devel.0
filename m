Received: from [209.85.198.243] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1K9s7W-0000AQ-AO
	for openembedded-devel@openembedded.org; Sat, 21 Jun 2008 03:42:26 +0200
Received: by rv-out-0708.google.com with SMTP id k29so7292652rvb.0
	for <openembedded-devel@openembedded.org>;
	Fri, 20 Jun 2008 18:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:x-enigmail-version:openpgp
	:content-type; bh=wD1vhETcZGHj93ZgL1ooEEgs0j5HMPdv+QzYqGL6l6k=;
	b=WxLQlsgzLabWdKeQtnIxHdVT6MR6uD48qVB5rSfrwg7NiJL5KBPyRQWplWzDio4AEM
	0AXxRYQjHQTTreYMiGrpRsM9d0pLZCdMBkTSK7X4X8fZPWK4ZlA42/yArhDnsLAoYDZe
	IGtKqoQyTzxnbG1zPSPubHibJL6meKqJ7RHws=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:x-enigmail-version:openpgp:content-type;
	b=j5cJinCX9Ly+AJP9JPr1mE8+sYBF9MryoBapdPtT9o9ZMWoQkAO9FI2UFAAfa/q+eq
	r88k+KN6jsfPL/MNhqPFiVNInDWxpR973sfM2WxOoLse3c1AbQv+FhtIdQFEaZIZOBH3
	wg/lOMq/uam3sZLya1mVFW0odHdC/2tZs05zA=
Received: by 10.141.29.21 with SMTP id g21mr8498217rvj.225.1214012462373;
	Fri, 20 Jun 2008 18:41:02 -0700 (PDT)
Received: from ?192.168.1.71? ( [71.146.22.107])
	by mx.google.com with ESMTPS id z15sm3623708pod.2.2008.06.20.18.41.01
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 20 Jun 2008 18:41:01 -0700 (PDT)
Message-ID: <485C5C2C.9050709@gmail.com>
Date: Fri, 20 Jun 2008 18:41:00 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Thunderbird 2.0.0.14 (X11/20080505)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
X-Enigmail-Version: 0.95.0
OpenPGP: id=A57A7A6E;
	url=pool.sks-keyservers.net
Subject: oldincludedir and includedir not pointing to staging
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Sat, 21 Jun 2008 01:42:26 -0000
Content-Type: multipart/mixed; boundary="------------080708050009070208000307"

--------------080708050009070208000307
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi

This patch fixes the configure parameters --includedir and --oldincludedir. After the sysroot change they need to be adjusted too.
I have been using this change for quite sometime now havent seen any fallouts. OK for .dev ?

Thanks

- -Khem

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFIXFwsHnJKy6V6em4RArWTAJ0dsKpsIKmDQIbmC7waNQgobGTkFwCfSyRh
+q22IejBZ3N7VfSY0QOIpQw=
=/kuv
-----END PGP SIGNATURE-----
#
# old_revision [c06692d78b5f67ad833d158b77fdde9b4b404dcd]
#
# patch "classes/cross.bbclass"
#  from [504bbe85b9aae389cdf483045310b7f26d7a5fb4]
#    to [bdd50d7b0204dc37533449d262a744351c880e4e]
#
============================================================
--- classes/cross.bbclass	504bbe85b9aae389cdf483045310b7f26d7a5fb4
+++ classes/cross.bbclass	bdd50d7b0204dc37533449d262a744351c880e4e
@@ -49,8 +49,8 @@ libdir = "${exec_prefix}/lib"
 sbindir = "${exec_prefix}/bin"
 libexecdir = "${exec_prefix}/libexec"
 libdir = "${exec_prefix}/lib"
-includedir = "${exec_prefix}/include"
-oldincludedir = "${exec_prefix}/include"
+includedir = "${STAGING_DIR_TARGET}/${layout_includedir}"
+oldincludedir = "${STAGING_DIR_TARGET}/${layout_includedir}"
 
 do_stage () {
 	oe_runmake install

--------------080708050009070208000307--
