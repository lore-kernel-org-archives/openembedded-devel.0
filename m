Received: from mail-gx0-f228.google.com ([209.85.217.228])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1ODAkT-0002Fn-Av
	for openembedded-devel@lists.openembedded.org;
	Sat, 15 May 2010 08:21:22 +0200
Received: by gxk28 with SMTP id 28so2062328gxk.7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 May 2010 23:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=r2F95jipgFzEylqlsKPSILZ0LmJM1CeLcXQIrVreqSo=;
	b=pu5qNMUD4ZNu7Jf+ixmbG9TeMcwaYmTlMiK6Dq7P5Y+2cEo6PEitxqWP/BA2Cc1jrF
	sqpq/buNGxES+CZJzMxHsswyeaNQ4xmpgdAthRM+fvobL+LO/NrLHLOivrX86ywW905u
	/yu2Rhw2fSs/12a5lDzSJv7lShvrveY4AJvpU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=yHnS7xH/ALUeU5kiKYrBz1idvNsNmO77mugwZErbl2BqGA9YF0NYjVNn5W8Fi1do9g
	/4MAZavWJY++hZ6iaIp4o6oK+H+Loj1rWy0z+x/1bK6/uMeWju4OadNHboRTySNaaNNu
	sKn/wFx2gjsxiFZKBx3h/H56R0ACUj3LvYGNc=
MIME-Version: 1.0
Received: by 10.101.174.20 with SMTP id b20mr2738980anp.243.1273904243607; 
	Fri, 14 May 2010 23:17:23 -0700 (PDT)
Received: by 10.100.96.12 with HTTP; Fri, 14 May 2010 23:17:23 -0700 (PDT)
In-Reply-To: <AANLkTil2qHZfmWTZXunj5iWnMZg0vFDDFEtzFSR9t7Ok@mail.gmail.com>
References: <AANLkTil2qHZfmWTZXunj5iWnMZg0vFDDFEtzFSR9t7Ok@mail.gmail.com>
Date: Fri, 14 May 2010 23:17:23 -0700
Message-ID: <AANLkTinuZ0-7oI-cEQVr7YkFtZm8GLZ2_IIkIizB3wjA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.217.228
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: failure building opkg-native on 64 bit Ubuntu
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
X-List-Received-Date: Sat, 15 May 2010 06:21:22 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, May 14, 2010 at 8:43 PM, Steve Sakoman <sakoman@gmail.com> wrote:
> Building with oe.dev. =A0Works on 32 bit Ubuntu, but fails on the 64 bit =
version.
>
> Any ideas? =A0Below is log.do_compile:

hmmm I have 10.04 running on 64bit I dont see this error. Can you also
post your local.conf
and anything you have in ASSUME_PROVIDED list.

>
> NOTE: make -j 4
> Making all in libbb
> =A0CC =A0 =A0gz_open.o
> =A0CC =A0 =A0unarchive.o
> =A0CC =A0 =A0unzip.o
> =A0CC =A0 =A0wfopen.o
> unarchive.c: In function 'extract_archive':
> unarchive.c:139: warning: ignoring return value of 'fread', declared
> with attribute warn_unused_result
> unarchive.c:246: warning: ignoring return value of 'chown', declared
> with attribute warn_unused_result
> unarchive.c: In function 'get_header_ar':
> unarchive.c:387: warning: ignoring return value of 'fread', declared
> with attribute warn_unused_result
> unarchive.c: In function 'deb_extract':
> unarchive.c:664: warning: ignoring return value of 'fread', declared
> with attribute warn_unused_result
> unzip.c: In function 'unzip':
> unzip.c:1002: warning: ignoring return value of 'fread', declared with
> attribute warn_unused_result
> =A0CC =A0 =A0copy_file_chunk.o
> =A0CC =A0 =A0copy_file.o
> =A0CC =A0 =A0xreadlink.o
> =A0CC =A0 =A0concat_path_file.o
> =A0CC =A0 =A0xfuncs.o
> =A0CC =A0 =A0last_char_is.o
> =A0CC =A0 =A0make_directory.o
> =A0CC =A0 =A0safe_strncpy.o
> =A0CC =A0 =A0parse_mode.o
> =A0CC =A0 =A0all_read.o
> =A0CC =A0 =A0time_string.o
> =A0CC =A0 =A0mode_string.o
> =A0LINK =A0libbb.la
> Making all in libopkg
> =A0CC =A0 =A0opkg.o
> =A0CC =A0 =A0opkg_configure.o
> =A0CC =A0 =A0opkg_download.o
> =A0CC =A0 =A0opkg_cmd.o
> =A0CC =A0 =A0opkg_install.o
> =A0CC =A0 =A0opkg_upgrade.o
> =A0CC =A0 =A0opkg_remove.o
> =A0CC =A0 =A0opkg_conf.o
> =A0CC =A0 =A0opkg_utils.o
> =A0CC =A0 =A0pkg.o
> =A0CC =A0 =A0pkg_depends.o
> =A0CC =A0 =A0pkg_extract.o
> =A0CC =A0 =A0hash_table.o
> =A0CC =A0 =A0pkg_hash.o
> =A0CC =A0 =A0pkg_parse.o
> =A0CC =A0 =A0pkg_vec.o
> =A0CC =A0 =A0file_util.o
> =A0CC =A0 =A0md5.o
> =A0CC =A0 =A0opkg_message.o
> =A0CC =A0 =A0xsystem.o
> =A0CC =A0 =A0xregex.o
> =A0CC =A0 =A0sprintf_alloc.o
> =A0CC =A0 =A0conffile.o
> =A0CC =A0 =A0conffile_list.o
> =A0CC =A0 =A0nv_pair.o
> =A0CC =A0 =A0sha256.o
> =A0CC =A0 =A0nv_pair_list.o
> =A0CC =A0 =A0pkg_dest.o
> =A0CC =A0 =A0pkg_dest_list.o
> =A0CC =A0 =A0pkg_src.o
> =A0CC =A0 =A0pkg_src_list.o
> =A0CC =A0 =A0void_list.o
> =A0CC =A0 =A0str_list.o
> =A0CC =A0 =A0active_list.o
> =A0LINK =A0libopkg.la
> x86_64-linux-libtool: link: cannot find the library `' or unhandled
> argument `/..//lib'
> make[2]: *** [libopkg.la] Error 1
> make[1]: *** [all] Error 2
> make: *** [all-recursive] Error 1
> FATAL: oe_runmake failed
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


