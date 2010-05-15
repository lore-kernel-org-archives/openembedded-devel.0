Received: from mail-qy0-f172.google.com ([209.85.221.172])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sakoman@gmail.com>) id 1ODHfo-0002ez-61
	for openembedded-devel@lists.openembedded.org;
	Sat, 15 May 2010 15:45:01 +0200
Received: by qyk2 with SMTP id 2so4437596qyk.20
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 May 2010 06:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=1EWQQLYsRBTR9IL3MCyVMMTBMZTxPODI1WTHEoYqCqo=;
	b=CWYQHnjpANk0+GOPUlTgBpVdzR5cxbxHp915IU2dxKIxQo9KsKgL+/2rx/F1NLHcsH
	db16OcQHL26TTdFZ+j2WKEP55oPe+a4n6SS+y7vLBUjU1bQHXJKszhVV6i6Z4UC75a8I
	BVoXFlHUQJhkEWY3y8AR82CUZsXDvu2Nn2ncc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=IjyC4Bj5ClhnQ9S3NOJhr1BnUzimXBmh7LpqBEfjKtKdpPS3hJmazz+1kEt4jDJS5q
	ZCKfr/OaL+7ZPd/JWSqg8Nx4kSIDLNkfRZkoPtw3FyGt5VpiwB2MeXROG0KFDgI3+Zu7
	wJEoG/1aHcR8Y+YJtlrzSXfyTgKykcHiJopVE=
MIME-Version: 1.0
Received: by 10.229.38.148 with SMTP id b20mr644725qce.139.1273930861624; Sat, 
	15 May 2010 06:41:01 -0700 (PDT)
Received: by 10.229.83.210 with HTTP; Sat, 15 May 2010 06:41:01 -0700 (PDT)
In-Reply-To: <AANLkTinuZ0-7oI-cEQVr7YkFtZm8GLZ2_IIkIizB3wjA@mail.gmail.com>
References: <AANLkTil2qHZfmWTZXunj5iWnMZg0vFDDFEtzFSR9t7Ok@mail.gmail.com>
	<AANLkTinuZ0-7oI-cEQVr7YkFtZm8GLZ2_IIkIizB3wjA@mail.gmail.com>
Date: Sat, 15 May 2010 06:41:01 -0700
Message-ID: <AANLkTilk2Zb_F5psNZJNC8t9bfp7OOnMnAK5nyYIz96y@mail.gmail.com>
From: Steve Sakoman <sakoman@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.221.172
X-SA-Exim-Mail-From: sakoman@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
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
X-List-Received-Date: Sat, 15 May 2010 13:45:01 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, May 14, 2010 at 11:17 PM, Khem Raj <raj.khem@gmail.com> wrote:

> hmmm I have 10.04 running on 64bit I dont see this error.

I'm running 9.04 64 bit server.

> Can you also post your local.conf
> and anything you have in ASSUME_PROVIDED list.

Local conf is:

DISTRO =3D "angstrom-2008.1"
DISTRO_TYPE =3D "debug"

ENABLE_BINARY_LOCALE_GENERATION=3D0

INHERIT +=3D "rm_work"

I currently have nothing in ASSUME_PROVIDED.

Steve

>
>>
>> NOTE: make -j 4
>> Making all in libbb
>> =A0CC =A0 =A0gz_open.o
>> =A0CC =A0 =A0unarchive.o
>> =A0CC =A0 =A0unzip.o
>> =A0CC =A0 =A0wfopen.o
>> unarchive.c: In function 'extract_archive':
>> unarchive.c:139: warning: ignoring return value of 'fread', declared
>> with attribute warn_unused_result
>> unarchive.c:246: warning: ignoring return value of 'chown', declared
>> with attribute warn_unused_result
>> unarchive.c: In function 'get_header_ar':
>> unarchive.c:387: warning: ignoring return value of 'fread', declared
>> with attribute warn_unused_result
>> unarchive.c: In function 'deb_extract':
>> unarchive.c:664: warning: ignoring return value of 'fread', declared
>> with attribute warn_unused_result
>> unzip.c: In function 'unzip':
>> unzip.c:1002: warning: ignoring return value of 'fread', declared with
>> attribute warn_unused_result
>> =A0CC =A0 =A0copy_file_chunk.o
>> =A0CC =A0 =A0copy_file.o
>> =A0CC =A0 =A0xreadlink.o
>> =A0CC =A0 =A0concat_path_file.o
>> =A0CC =A0 =A0xfuncs.o
>> =A0CC =A0 =A0last_char_is.o
>> =A0CC =A0 =A0make_directory.o
>> =A0CC =A0 =A0safe_strncpy.o
>> =A0CC =A0 =A0parse_mode.o
>> =A0CC =A0 =A0all_read.o
>> =A0CC =A0 =A0time_string.o
>> =A0CC =A0 =A0mode_string.o
>> =A0LINK =A0libbb.la
>> Making all in libopkg
>> =A0CC =A0 =A0opkg.o
>> =A0CC =A0 =A0opkg_configure.o
>> =A0CC =A0 =A0opkg_download.o
>> =A0CC =A0 =A0opkg_cmd.o
>> =A0CC =A0 =A0opkg_install.o
>> =A0CC =A0 =A0opkg_upgrade.o
>> =A0CC =A0 =A0opkg_remove.o
>> =A0CC =A0 =A0opkg_conf.o
>> =A0CC =A0 =A0opkg_utils.o
>> =A0CC =A0 =A0pkg.o
>> =A0CC =A0 =A0pkg_depends.o
>> =A0CC =A0 =A0pkg_extract.o
>> =A0CC =A0 =A0hash_table.o
>> =A0CC =A0 =A0pkg_hash.o
>> =A0CC =A0 =A0pkg_parse.o
>> =A0CC =A0 =A0pkg_vec.o
>> =A0CC =A0 =A0file_util.o
>> =A0CC =A0 =A0md5.o
>> =A0CC =A0 =A0opkg_message.o
>> =A0CC =A0 =A0xsystem.o
>> =A0CC =A0 =A0xregex.o
>> =A0CC =A0 =A0sprintf_alloc.o
>> =A0CC =A0 =A0conffile.o
>> =A0CC =A0 =A0conffile_list.o
>> =A0CC =A0 =A0nv_pair.o
>> =A0CC =A0 =A0sha256.o
>> =A0CC =A0 =A0nv_pair_list.o
>> =A0CC =A0 =A0pkg_dest.o
>> =A0CC =A0 =A0pkg_dest_list.o
>> =A0CC =A0 =A0pkg_src.o
>> =A0CC =A0 =A0pkg_src_list.o
>> =A0CC =A0 =A0void_list.o
>> =A0CC =A0 =A0str_list.o
>> =A0CC =A0 =A0active_list.o
>> =A0LINK =A0libopkg.la
>> x86_64-linux-libtool: link: cannot find the library `' or unhandled
>> argument `/..//lib'
>> make[2]: *** [libopkg.la] Error 1
>> make[1]: *** [all] Error 2
>> make: *** [all-recursive] Error 1
>> FATAL: oe_runmake failed
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


