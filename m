Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id A0757606D0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jul 2016 08:37:36 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id x83so11510337wma.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jul 2016 01:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=2c1locMSUPHBw7d6XXKhtgHeyIYO2R7O3QT16+oqH58=;
	b=ITXoAmdbL56ELAm3jzPrMLrbr8ycSlc1hWdqsL7LhUGmz6/A2GmVJGdFSCM+6Bvkz7
	H39mynHAXaeMtuR+vA48YjfFg7V1uA7exAJaUvq4nt3CTiPW70TKG872bc6b0t3XlfGW
	aqDWG/M9qmjXHKqUVFavENg8+AkvlUcK8yJtdOhqn1rw1T7AkH9VSgmcLIYgpW/jMZDJ
	pvw2cMSUarCPwIZZqWHMxy/6UIIMdjdfqFncIO6/zBO/TTrNJF93+P6k/6DiOrHNQbki
	P7hA5JVAjDJddD1I9H2Vj6Myb8N0MuXh9I1ajZBbBz4uGUw+Fcw/AZQ2KX4MKhLAXARo
	QN3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-transfer-encoding;
	bh=2c1locMSUPHBw7d6XXKhtgHeyIYO2R7O3QT16+oqH58=;
	b=NIEjSPAqjsUihsyY1tQZg+2wGJrZD5qK59e2eecGSwhGWPhLOGkuL+rE5OiMO5f5Eb
	rNpeUf7KKwMbAacqRY0c2TIgTu3RtlxblLDPvOqNPeEAm99ipbGh7QtxcdG0pDAvBt+e
	PstQ/Ilz5leb4zu5AcFOpjkMIDCEc7Gy/RF5Cpo1v03tQMywBRIO657C6HuMol3rwZzN
	vI7wkk8S/8Zu3p4vAfS7PBfC/srsjej3jqEikB5W0gtu+4qf/s9oOOOVAG/1CIed1/W8
	prSnO67MfOfhBJbxV7Ivkj3GVMd/Xx5T12dV3Zvm8tRMCCxyrpa19ldxB1bvoflFys0M
	sZ5w==
X-Gm-Message-State: ALyK8tLjC2uL3xoh64o+O6fXDxOrAveKTCwf9Mu+K/a1plZDfuNY6PmOpiZx3+4oeDkoCGqurzjsAIKPYO0bSw==
X-Received: by 10.28.211.10 with SMTP id k10mr7063700wmg.16.1468831056413;
	Mon, 18 Jul 2016 01:37:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.194.145.39 with HTTP; Mon, 18 Jul 2016 01:37:35 -0700 (PDT)
In-Reply-To: <CAMKF1spStNbUubBvO1DLq86wdHRVbGvOVB7LRUVa2be0Mdes3Q@mail.gmail.com>
References: <1468828968-19388-1-git-send-email-git@andred.net>
	<1468828968-19388-2-git-send-email-git@andred.net>
	<CAMKF1spStNbUubBvO1DLq86wdHRVbGvOVB7LRUVa2be0Mdes3Q@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 18 Jul 2016 01:37:35 -0700
Message-ID: <CAJ86T=XnuktZ1DB6_Cco+0NnjFOAaa6F4+=dCW8+Pw1t_Yo4nA@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH v2 2/2] meta-networking: override SECURITY_CFLAGS for c-ares
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 18 Jul 2016 08:37:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 18, 2016 at 1:16 AM, Khem Raj <raj.khem@gmail.com> wrote:
> On Mon, Jul 18, 2016 at 1:03 AM <git@andred.net> wrote:
>
>> From: Andr=C3=A9 Draszik <adraszik@tycoint.com>
>>
>> c-ares doesn't build if the distro has enabled usage of the
>> security_flags.inc file as it is picky about what is placed
>> into CPPFLAGS and CFLAGS. It complains and errors out if any
>> preprocessor options appear in CFLAGS.

Curl (on which c-ares's configure files seem to be based) used to have
the same problem but was fixed upstream by:

  https://github.com/curl/curl/commit/5d3cbde72ece7d83c280492957a26e26ab4e5=
cca

>> Fix this by providing an additional include file that is
>> require'd from conf/layer.conf which for c-ares moves the
>> defines added by security_flags.inc from CFLAGS to CPPFLAGS.
>>
>> Signed-off-by: Andr=C3=A9 Draszik <adraszik@tycoint.com>
>> ---
>>  .../conf/distro/include/meta_networking_security_flags.inc          | 6
>> ++++++
>>  meta-networking/conf/layer.conf                                     | 3
>> +++
>>  2 files changed, 9 insertions(+)
>>  create mode 100644
>> meta-networking/conf/distro/include/meta_networking_security_flags.inc
>>
>> diff --git
>> a/meta-networking/conf/distro/include/meta_networking_security_flags.inc
>> b/meta-networking/conf/distro/include/meta_networking_security_flags.inc
>> new file mode 100644
>> index 0000000..06802d6
>> --- /dev/null
>> +++
>> b/meta-networking/conf/distro/include/meta_networking_security_flags.inc
>> @@ -0,0 +1,6 @@
>> +# configure righteously complains:
>> +# | configure:3479: using CFLAGS:  -O2 -pipe -g
>> -feliminate-unused-debug-types -fstack-protector-strong -pie -fpie
>> -D_FORTIFY_SOURCE=3D2
>> +# | configure:3485: CFLAGS error: CFLAGS may only be used to specify C
>> compiler flags, not macro definitions. Use CPPFLAGS for: -D_FORTIFY_SOUR=
CE=3D2
>> +# | configure:3516: error: Can not continue. Fix errors mentioned
>> immediately above this line.
>> +TARGET_CFLAGS_remove_pn-c-ares =3D "${lcl_maybe_fortify}"
>> +TARGET_CPPFLAGS_append_pn-c-ares =3D "${lcl_maybe_fortify}"
>>
>
> will
>
> lcl_maybe_fortify_pn-c-area =3D ""
>
> work ?
>
>
>> diff --git a/meta-networking/conf/layer.conf
>> b/meta-networking/conf/layer.conf
>> index 5fd636a..c09ba4a 100644
>> --- a/meta-networking/conf/layer.conf
>> +++ b/meta-networking/conf/layer.conf
>> @@ -21,3 +21,6 @@ LICENSE_PATH +=3D "${LAYERDIR}/licenses"
>>
>>  # used by waf-samba.bbclass
>>  WAF_CROSS_ANSWERS_PATH =3D "${LAYERDIR}/files/waf-cross-answers"
>> +
>> +# Override security flags
>> +require conf/distro/include/meta_networking_security_flags.inc
>> --
>> 2.8.1
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

