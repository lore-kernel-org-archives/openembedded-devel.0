Received: from mail-qy0-f172.google.com ([209.85.221.172])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sakoman@gmail.com>) id 1OD8LQ-0008V2-SJ
	for openembedded-devel@lists.openembedded.org;
	Sat, 15 May 2010 05:47:21 +0200
Received: by qyk2 with SMTP id 2so4045916qyk.20
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 May 2010 20:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=j8w8OC8f8cC2RCRHf8JTeyhqd7XllcnmSciesKnYvXM=;
	b=Vk2VwQ3zh3R/gtgofsgA4o5Z2nxlyYU8w56m6Wqbj4UaDf/DBWK6XzalGc09t3Q5a6
	Cc1SbPpVSRtbAh4AEpLQCRZ0J+vrbwKUULMaq09UVBqsyKQlefim/lzqHO5MbW6S6r6d
	YrpS9+8yalnjc2Gr+kcMFabXl3Si3O37O+VJU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=fSEnv3mLCYD1/D8+LKu/q9Q2dSNH7gju+uQ75OSgowhOttcGHy2uratGZd5gA47RrA
	OTxaU5zt0jpUdt1EyyP7QQYAh2ekIurZjybLog9CSD5sM8Xd5UbgBVnko8yNX2mNouBH
	9zaFZoWYrCmgt4S0k/6FpGT7HAqdH77978Ols=
MIME-Version: 1.0
Received: by 10.229.229.68 with SMTP id jh4mr541117qcb.179.1273895002657; Fri, 
	14 May 2010 20:43:22 -0700 (PDT)
Received: by 10.229.83.210 with HTTP; Fri, 14 May 2010 20:43:22 -0700 (PDT)
Date: Fri, 14 May 2010 20:43:22 -0700
Message-ID: <AANLkTil2qHZfmWTZXunj5iWnMZg0vFDDFEtzFSR9t7Ok@mail.gmail.com>
From: Steve Sakoman <sakoman@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 209.85.221.172
X-SA-Exim-Mail-From: sakoman@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: failure building opkg-native on 64 bit Ubuntu
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
X-List-Received-Date: Sat, 15 May 2010 03:47:21 -0000
Content-Type: text/plain; charset=ISO-8859-1

Building with oe.dev.  Works on 32 bit Ubuntu, but fails on the 64 bit version.

Any ideas?  Below is log.do_compile:

NOTE: make -j 4
Making all in libbb
  CC    gz_open.o
  CC    unarchive.o
  CC    unzip.o
  CC    wfopen.o
unarchive.c: In function 'extract_archive':
unarchive.c:139: warning: ignoring return value of 'fread', declared
with attribute warn_unused_result
unarchive.c:246: warning: ignoring return value of 'chown', declared
with attribute warn_unused_result
unarchive.c: In function 'get_header_ar':
unarchive.c:387: warning: ignoring return value of 'fread', declared
with attribute warn_unused_result
unarchive.c: In function 'deb_extract':
unarchive.c:664: warning: ignoring return value of 'fread', declared
with attribute warn_unused_result
unzip.c: In function 'unzip':
unzip.c:1002: warning: ignoring return value of 'fread', declared with
attribute warn_unused_result
  CC    copy_file_chunk.o
  CC    copy_file.o
  CC    xreadlink.o
  CC    concat_path_file.o
  CC    xfuncs.o
  CC    last_char_is.o
  CC    make_directory.o
  CC    safe_strncpy.o
  CC    parse_mode.o
  CC    all_read.o
  CC    time_string.o
  CC    mode_string.o
  LINK  libbb.la
Making all in libopkg
  CC    opkg.o
  CC    opkg_configure.o
  CC    opkg_download.o
  CC    opkg_cmd.o
  CC    opkg_install.o
  CC    opkg_upgrade.o
  CC    opkg_remove.o
  CC    opkg_conf.o
  CC    opkg_utils.o
  CC    pkg.o
  CC    pkg_depends.o
  CC    pkg_extract.o
  CC    hash_table.o
  CC    pkg_hash.o
  CC    pkg_parse.o
  CC    pkg_vec.o
  CC    file_util.o
  CC    md5.o
  CC    opkg_message.o
  CC    xsystem.o
  CC    xregex.o
  CC    sprintf_alloc.o
  CC    conffile.o
  CC    conffile_list.o
  CC    nv_pair.o
  CC    sha256.o
  CC    nv_pair_list.o
  CC    pkg_dest.o
  CC    pkg_dest_list.o
  CC    pkg_src.o
  CC    pkg_src_list.o
  CC    void_list.o
  CC    str_list.o
  CC    active_list.o
  LINK  libopkg.la
x86_64-linux-libtool: link: cannot find the library `' or unhandled
argument `/..//lib'
make[2]: *** [libopkg.la] Error 1
make[1]: *** [all] Error 2
make: *** [all-recursive] Error 1
FATAL: oe_runmake failed


