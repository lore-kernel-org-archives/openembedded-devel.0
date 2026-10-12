Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C709BCA9ED2
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 21:19:25 +0000 (UTC)
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5237.1791839955547744770
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Oct 2026 14:19:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=kQ5HSzyr;
 spf=pass (domain: gmail.com, ip: 74.125.224.44, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-676858d42f8so1688626d50.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 14:19:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791839954; cv=none;
        d=google.com; s=arc-20260327;
        b=UuWRr+ttml4tDzuvl+wqHO50pYTWeX5RyxXhJDamKKTBd9y847SYhH5GJgCq7yisHf
         SX3ibQJo0QYdhy9xma+oVR+rspK1Bw5zjJ9dU4omaU8ubTiwGNeE6YPLErhWxVA2So2a
         VRUrfquSiLVhi+pdWXXuHjQoLV/5AnSo9rKIlbbkBY5jqq2a7VZ3ma2Zf7jG2KbCVpSQ
         iLG+eMu+HBoSyV+psSmNDFJHIKnpESVVyYp5je/7GF+499KGtStdrbpgdjydcVAFr1ys
         De2BSf9eLR+JmvPEWxeIQmrzDNLPsm0G9gHpjI56aHcwMhoGADU84ou+9dilulBZpOSM
         7b8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=HRDk0XyuqMs8Oxxuh3sDVqdw9rIxg0b35C5NUIfmQLQ=;
        fh=sQq4UwMItvi2zQkbQsQ7gG/lHqOQ30Mc0djsN0hkevw=;
        b=Ql/gMI1uY+/Lzm07EBV2JppaJO/sgsx47WRcARp30EMjBljj0x6DlyJB8K0GhtDepp
         5kcSvilqadV2vwoyf0a07VD5uQSKIIQuk2iYAnG95TiA0tWBWNyUuNoItZFZ1G3lTaxv
         AE+8eQoWVvX/6LuusM7kGv2ewy2kdLSwshl5/xVItYs9+7q+eb7OwQZQNWxxaJj+8Ryc
         uHwDXddL2RwI+PByWnXeLVK9NFcXp4rUuWjgENhKz0QT6hhTsgiJ2cxN4+r+rd3VdyUF
         RPVsURLZFJYD3wij8v/5nzM9FBo62fVhavrV2Cfo+9tzS1pV0aogkgJfxZ8kSOOQYptC
         AMZg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791839954; x=1792444754; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HRDk0XyuqMs8Oxxuh3sDVqdw9rIxg0b35C5NUIfmQLQ=;
        b=kQ5HSzyr+BiGSyecVO/pyQoUrainEHkITIvV7Oxoy8BF3+zrZC8CLISd2e77Eh4nn/
         YiDv7NgEgw1rWq6D5dnSGAZtYBBcXgS/xkkkBkiPVhdbi4dM+t9NE898tUXLKbyWxLqg
         EG71+Vg7R2sQaPBiBi6Rc7s5K/3v+9aTcFfb9jEXUjOlANyELi2GyKJOf1ufzWY5uc1W
         zUkyZNGUuATNajpBefIo/kGJ6qkh+CfJvv5KxGqUhqYYwwqmfy1+Cty85f7sbE/ETN8d
         Kqeayv0h+N+vrX88LSoNVCoEdPZf+/4KrUHYeiSQgqAE/1FCi1EqUBOGqNfxprh9T6Wg
         LuAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791839954; x=1792444754;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HRDk0XyuqMs8Oxxuh3sDVqdw9rIxg0b35C5NUIfmQLQ=;
        b=Wz9v53MgKYrGBWzlnMUkxMMtXaUD66aW8x0B/YGvRmWGBgcp9uk82BbbZusgToh7lV
         gZ3naFtycvaH9p8dIcSDSFXfFglPBzmSmrAm3+NgLPs+SSFD89T1T5iFu18ZrWKOqOco
         KID7KX2d3unceJ0/ss6QMAz48fiihzF4keb6vVYZ9g9cFkXVd0XRgMbrNRa7qnKBYpae
         7DFf8QaRbG2tEsczN2jVReE+xOvPjXxm9lWwRbER6T6UmRkUZECQnKzYFBKvoBiafN1w
         y0k+xXNQIjMHEodoaqgm/P0jYEJ+g12raQAQH9X/gdz5KjHJR8n1an5Y9QxePwkLxikv
         ntxA==
X-Gm-Message-State: AFq9FYI8Rjp448MXAdBo1qXAJgzx0vbZe96crvnmIA/GpnL7Tve7Z8dJ
	nnxGHIeTfHRbmRhGFdurocyuSmodDSIABhaOMxxHTIcYYficnNi+BCEV3xIoxIaSIZv0EF2LcFJ
	Bf7nCpJbOqFFpTZmzsL+KgmVDrXMoYqsj9LdhYCg=
X-Gm-Gg: AYBFou187sMV23g8xffnwSlZsFUQC/12imVggwGVEc2/RoigsEcQUmO99GCSTSKW0xY
	3oj1Yq9ugHFnm14lysubnyd2UNeriEldx8WGDUwVN/cYCZ2iSG/AaLCI4SNtwjp4wbvt0L+XHxi
	6SuVcmtdwyhwfWLeyG9JI25ntV33dhmHkNNIzMcrt21kJ0NfFOAFtzc5lNsKYMvt/O5cOr91iUf
	JQ+EyXtUmZJCpc7rK9WtwcRchUenyM4m9mE7kTVs6kaiMJPxlZEIT9bW1ZUmCmgvBj+Pz5/J+Pi
	yjhMkAfLiunab/96xRuXp4SjMsPMdvek4DgCTrb5ANKNsIPgLL0pPlTmSWY/eTePzEd13OKWUhO
	ye31Tp/ogFwYqzpwbefuHoGo7U0Bybeu+AGoEhLR0U8VrT8NhQgs2AF6MPjYZ1Zoeyo70o4xcvz
	oE270q5KP1N4HDs+GdtcH/XKK1RL+LMtH6+hKGVe2+yLnEB6EAVpeSVOHbaMQZxAEqDZcdy564C
	SoasTzeOCsucqqEjfLa7HGgUSGQ1DqRMRXEpkDEhbOKqssh6cQg+x4DBynpkJ1+EY6Cd61Fo+SD
	J2mkYg7seOHKicU9/A==
X-Received: by 2002:a05:690e:4147:b0:677:cb43:4b3a with SMTP id
 956f58d0204a3-679362e580dmr3327862d50.156.1791839953389; Mon, 12 Oct 2026
 14:19:13 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1791816187.git.anuj.mittal@oss.qualcomm.com>
In-Reply-To: <cover.1791816187.git.anuj.mittal@oss.qualcomm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 12 Oct 2026 14:18:46 -0700
X-Gm-Features: AclHuK-LNex4hQ2sXj4u8DRih8iSqMCASudvkcp1qdsFn7DwJL5e3bpzcXRDhMI
Message-ID: <CAMKF1spCjvZ+iqEG=SsVvPBwvqkNtLTdq1i-e2oLRB5BccVxMg@mail.gmail.com>
Subject: Re: [oe] [PATCH 00/99] Wrynose pull request
To: anuj.mittal@oss.qualcomm.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000ea8c66065dab3fe2"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 21:19:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130814

--000000000000ea8c66065dab3fe2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Looks good. Applied now thanks Anuj

On Mon, Oct 12, 2026 at 7:51=E2=80=AFAM Anuj Mittal via lists.openembedded.=
org
<anuj.mittal=3Doss.qualcomm.com@lists.openembedded.org> wrote:

> Please merge these changes in wrynose. Tested locally and on autobuilder.
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/113/builds/1773
>
> The following changes since commit
> 47d7dbdd10890bbd429bc0cccbe14435c37e5af1:
>
>   unbound: patch CVE-2026-56444 (2026-09-15 10:14:05 +0530)
>
> are available in the Git repository at:
>
>   https://git.openembedded.org/meta-openembedded-contrib anujm/wrynose
>
> https://git.openembedded.org/meta-openembedded-contrib/log/?h=3Danujm/wry=
nose
>
> for you to fetch changes up to f28a144aa0a0ae05ca2ee91e1aef6aa05f6a12db:
>
>   vboxguestdrivers: fix vboxvideo build on kernels lacking
> drm_fb_helper_alloc_info (2026-10-06 13:52:06 +0530)
>
> ----------------------------------------------------------------
>
> Ankur Tyagi (63):
>   python3-django: upgrade 6.0.7 -> 6.0.8
>   python3-eventlet: mark CVE-2023-29483 fixed
>   python3-marshmallow: mark CVE-2025-68480 fixed
>   python3-sqlparse: patch CVE-2026-54284
>   python3-sqlparse: patch CVE-2026-59893
>   python3-sqlparse: patch CVE-2026-59894
>   python3-sqlparse: patch CVE-2026-71491
>   python3-tornado: mark CVEs fixed
>   c-ares: mark CVEs fixed
>   cjose: mark CVE-2026-53938 and CVE-2026-53939 fixed
>   cjson: patch CVE-2026-87933
>   colord: ignore CVE-2026-85062
>   flatcc: patch CVE-2026-90786
>   flatcc: patch CVE-2026-90785
>   fluidsynth: mark CVEs fixed
>   freeipmi: patch CVE-2026-85509
>   freeipmi: patch CVE-2026-85508
>   freeipmi: patch CVE-2026-85507
>   freeipmi: patch CVE-2026-85506
>   freeipmi: patch CVE-2026-85505
>   freeipmi: patch CVE-2026-85504
>   libde265: patch CVE-2026-54240 and CVE-2026-54241
>   libheif: ignore CVE-2026-84383
>   libwebsockets: patch CVE-2026-19773
>   libopenmpt: upgrade 0.8.4 -> 0.8.6
>   smarty: mark CVEs patched
>   libssh: ignore CVE-2026-59842
>   ntopng: ignore CVE-2026-84989
>   ntopng: patch CVE-2026-84990
>   ntopng: patch CVE-2026-86090 and CVE-2026-86091
>   rabbitmq-c: patch CVE-2026-44236
>   redis: patch CVE-2026-81934
>   sngrep: patch CVE-2026-90558
>   strongswan: patch CVE-2026-78123
>   strongswan: patch CVE-2026-78124
>   strongswan: patch CVE-2026-78126
>   strongswan: patch CVE-2026-78127
>   strongswan: patch CVE-2026-78129
>   strongswan: patch CVE-2026-78133
>   strongswan: patch CVE-2026-78131
>   strongswan: patch CVE-2026-78130
>   strongswan: patch CVE-2026-78132
>   strongswan: patch CVE-2026-78135
>   strongswan: patch CVE-2026-78134
>   tesseract: patch CVE-2026-88052
>   tesseract: patch CVE-2026-88048
>   tesseract: patch CVE-2026-88049
>   tesseract: patch CVE-2026-88050
>   tesseract: patch CVE-2026-88047
>   tesseract: patch CVE-2026-88051
>   tesseract: patch CVE-2026-88054
>   valkey: upgrade 9.0.5 -> 9.0.6
>   valkey: mark CVE-2026-86227 fixed
>   unbound: patch CVE-2026-80225
>   unbound: patch CVE-2026-81642
>   unbound: patch CVE-2026-78227
>   unbound: patch CVE-2026-77860
>   python3-tornado: patch CVE-2026-91990
>   python3-tornado: patch CVE-2026-82397
>   python3-tornado: patch CVE-2026-91991
>   freerdp3: patch CVE-2026-85089
>   freerdp3: patch CVE-2026-85090
>   gpsd: patch CVE-2026-60122
>
> Anuj Mittal (1):
>   vboxguestdrivers: fix vboxvideo build on kernels lacking
>     drm_fb_helper_alloc_info
>
> Aravind Bandari (2):
>   python3-pillow: fix CVE-2026-54058
>   python3-pillow: fix CVE-2026-59204
>
> Devansh Patel (16):
>   python3-py: correct CVE_PRODUCT mapping
>   ldns: correct CVE_PRODUCT mapping
>   dnsmasq: correct CVE_PRODUCT mapping
>   jq: correct CVE_PRODUCT mapping
>   python3-twisted: correct CVE_PRODUCT mapping
>   php: correct CVE_PRODUCT mapping
>   python3-ldap: correct python-ldap CVE_PRODUCT mapping
>   mariadb: correct CVE_PRODUCT mapping
>   libssh: correct CVE_PRODUCT mapping
>   python3-flask-user: correct CVE_PRODUCT mapping
>   python3-aiohttp: correct CVE_PRODUCT mapping
>   python3-werkzeug: correct CVE_PRODUCT mapping
>   python3-flask: correct CVE_PRODUCT mapping
>   python3-twitter: correct Tweepy CVE_PRODUCT mapping
>   python3-ujson: add CVE_PRODUCT mapping
>   python3-waitress: correct CVE_PRODUCT mapping
>
> Jaipaul Cheernam (1):
>   abseil-cpp: fix 32-bit x86 build of hash.cc
>
> Jason Schonberg (2):
>   nodejs: upgrade 22.23.2 -> 22.23.3
>   php: upgrade 8.5.10 -> 8.5.11
>
> Khem Raj (1):
>   openvpn: upgrade 2.7.0 -> 2.7.5
>
> Leon Anavi (1):
>   python3-tzdata: Upgrade 2026.3 -> 2026.4
>
> Louis Rannou (1):
>   openvpn: create an extra package for the dns-updown script
>
> Mehmet Fide (1):
>   spidev-test: clean the build dir before configure
>
> Nate Kent (1):
>   nanomsg: upgrade 1.2.4 -> 1.2.5
>
> Peter Marko (4):
>   msgpack-c: patch CVE-2026-72854
>   recipes: correct homepage
>   polkit: patch CVE-2026-4897 and CVE-2026-85498
>   syslog-ng: patch CVE-2026-39879
>
> Sana Kazi (1):
>   avro-c++: Use fmt from oe-core instead of bundling fmt 10.2.1
>
> Viswanath Kraleti (1):
>   libfastjson: switch git branch from master to main
>
> Wang Mingyu (3):
>   faad2: upgrade 2.11.2 -> 2.11.3
>   libmxml: upgrade 4.0.4 -> 4.0.5
>   nanomsg: upgrade 1.2.2 -> 1.2.4
>
>  .../fluidsynth/fluidsynth_2.5.7.bb            |   6 +
>  .../CVE-2026-54240-CVE-2026-54241.patch       | 426 ++++++++++
>  .../libde265/libde265_1.0.19.bb               |   1 +
>  .../libheif/libheif_1.21.2.bb                 |   2 +
>  ...ibopenmpt_0.8.4.bb =3D> libopenmpt_0.8.6.bb} |   4 +-
>  .../{nanomsg_1.2.2.bb =3D> nanomsg_1.2.5.bb}    |   4 +-
>  .../recipes-support/dnsmasq/dnsmasq_2.93.bb   |   2 +
>  .../ntopng/files/CVE-2026-84990.patch         |  53 ++
>  .../files/CVE-2026-86090-CVE-2026-86091.patch |  67 ++
>  .../recipes-support/ntopng/ntopng_6.6.bb      |   4 +
>  ...-test-execution-when-cross-compiling.patch |  34 -
>  .../openvpn/openvpn/CVE-2026-13117.patch      |  46 --
>  .../openvpn/openvpn/CVE-2026-40215.patch      |  59 --
>  .../{openvpn_2.7.0.bb =3D> openvpn_2.7.5.bb}    |  10 +-
>  .../sngrep/sngrep/CVE-2026-90558.patch        |  84 ++
>  .../recipes-support/sngrep/sngrep_1.8.2.bb    |   4 +-
>  .../strongswan/CVE-2026-78123.patch           |  51 ++
>  .../strongswan/CVE-2026-78124.patch           |  34 +
>  .../strongswan/CVE-2026-78126.patch           |  37 +
>  .../strongswan/CVE-2026-78127.patch           | 115 +++
>  .../strongswan/CVE-2026-78129.patch           | 155 ++++
>  .../strongswan/CVE-2026-78130.patch           |  49 ++
>  .../strongswan/CVE-2026-78131.patch           |  86 ++
>  .../strongswan/CVE-2026-78132.patch           |  75 ++
>  .../strongswan/CVE-2026-78133.patch           | 620 ++++++++++++++
>  .../strongswan/CVE-2026-78134.patch           | 712 ++++++++++++++++
>  .../strongswan/CVE-2026-78135.patch           |  72 ++
>  .../strongswan/strongswan_6.0.6.bb            |  11 +
>  .../unbound/unbound/CVE-2026-77860.patch      |  31 +
>  .../unbound/unbound/CVE-2026-78227.patch      |  30 +
>  .../unbound/unbound/CVE-2026-80225.patch      | 286 +++++++
>  .../unbound/unbound/CVE-2026-81642.patch      |  30 +
>  .../recipes-support/unbound/unbound_1.24.2.bb |   4 +
>  .../libwebsockets/CVE-2026-19773.patch        |  31 +
>  .../libwebsockets/libwebsockets_4.5.8.bb      |   1 +
>  .../rabbitmq-c/CVE-2026-44236.patch           | 145 ++++
>  .../rabbitmq-c/rabbitmq-c_0.15.0.bb           |   1 +
>  meta-oe/recipes-dbs/mysql/mariadb_11.4.12.bb  |   2 +
>  ...-x86-AES-SIMD-path-to-64-bit-targets.patch |  34 +
>  .../abseil-cpp/abseil-cpp_20260107.1.bb       |   1 +
>  .../cjson/cjson/CVE-2026-87933.patch          | 110 +++
>  .../recipes-devtools/cjson/cjson_1.7.19.bb    |   1 +
>  .../flatcc/flatcc/CVE-2026-90785.patch        |  29 +
>  .../flatcc/flatcc/CVE-2026-90786.patch        |  40 +
>  meta-oe/recipes-devtools/flatcc/flatcc_git.bb |   2 +
>  meta-oe/recipes-devtools/jq/jq_1.8.1.bb       |   2 +
>  meta-oe/recipes-devtools/ldns/ldns_1.9.2.bb   |   2 +
>  .../msgpack/msgpack-c/CVE-2026-72854.patch    | 127 +++
>  .../msgpack/msgpack-c_6.1.0.bb                |   4 +-
>  .../{nodejs_22.23.2.bb =3D> nodejs_22.23.3.bb}  |   2 +-
>  .../php/{php_8.5.10.bb =3D> php_8.5.11.bb}      |   4 +-
>  .../polkit/files/CVE-2026-4897-01.patch       |  64 ++
>  .../polkit/files/CVE-2026-4897-02.patch       |  32 +
>  .../polkit/files/CVE-2026-85498.patch         |  38 +
>  meta-oe/recipes-extended/polkit/polkit_127.bb |   7 +-
>  .../redis/redis-8.0.6/CVE-2026-81934.patch    |  53 ++
>  meta-oe/recipes-extended/redis/redis_8.0.6.bb |   1 +
>  .../rsyslog/libfastjson_1.2304.0.bb           |   2 +-
>  .../{valkey_9.0.5.bb =3D> valkey_9.0.6.bb}      |   3 +-
>  .../tesseract/tesseract/CVE-2026-88047.patch  | 226 ++++++
>  .../tesseract/tesseract/CVE-2026-88048.patch  | 228 ++++++
>  .../tesseract/tesseract/CVE-2026-88049.patch  | 316 ++++++++
>  .../tesseract/tesseract/CVE-2026-88050.patch  | 210 +++++
>  .../tesseract/tesseract/CVE-2026-88051.patch  | 185 +++++
>  .../tesseract/tesseract/CVE-2026-88052.patch  | 165 ++++
>  .../tesseract/tesseract/CVE-2026-88054.patch  | 275 +++++++
>  .../tesseract/tesseract_5.5.2.bb              |   7 +
>  .../recipes-kernel/spidev-test/spidev-test.bb |   1 +
>  .../{faad2_2.11.2.bb =3D> faad2_2.11.3.bb}      |   6 +-
>  .../gpsd/gpsd/CVE-2026-60122.patch            |  45 ++
>  .../recipes-navigation/gpsd/gpsd_3.27.5.bb    |   1 +
>  .../recipes-support/avro/avro-c++_1.12.1.bb   |  10 +-
>  .../recipes-support/c-ares/c-ares_1.34.8.bb   |   3 +
>  .../recipes-support/cjose/cjose_0.6.2.8.bb    |   2 +
>  meta-oe/recipes-support/colord/colord.bb      |   1 +
>  .../freeipmi/freeipmi/CVE-2026-85504.patch    |  93 +++
>  .../freeipmi/freeipmi/CVE-2026-85505.patch    |  49 ++
>  .../freeipmi/freeipmi/CVE-2026-85506.patch    |  51 ++
>  .../freeipmi/freeipmi/CVE-2026-85507.patch    |  50 ++
>  .../freeipmi/freeipmi/CVE-2026-85508.patch    |  51 ++
>  .../freeipmi/freeipmi/CVE-2026-85509.patch    |  54 ++
>  .../freeipmi/freeipmi_1.6.17.bb               |   6 +
>  .../freerdp/freerdp3/CVE-2026-85089-1.patch   |  28 +
>  .../freerdp/freerdp3/CVE-2026-85089-2.patch   |  28 +
>  .../freerdp/freerdp3/CVE-2026-85090.patch     |  59 ++
>  .../freerdp/freerdp3_3.24.2.bb                |   3 +
>  .../{libmxml_4.0.4.bb =3D> libmxml_4.0.5.bb}    |   4 +-
>  .../recipes-support/libssh/libssh_0.11.5.bb   |   2 +
>  .../recipes-support/smarty/smarty_5.8.4.bb    |   4 +
>  .../syslog-ng/files/CVE-2026-39879-01.patch   |  65 ++
>  .../syslog-ng/files/CVE-2026-39879-02.patch   | 572 +++++++++++++
>  .../syslog-ng/files/CVE-2026-39879-03.patch   | 758 ++++++++++++++++++
>  .../syslog-ng/files/CVE-2026-39879-04.patch   | 176 ++++
>  .../syslog-ng/syslog-ng_4.11.0.bb             |   4 +
>  ...-build-decide-if-drm_fb_helper_alloc.patch |  52 ++
>  .../vboxguestdrivers_7.2.8.bb                 |   9 +-
>  .../python/python3-aiohttp_3.13.5.bb          |   2 +-
>  .../python/python3-beautifulsoup4_4.14.3.bb   |   2 +-
>  .../python/python3-colorzero_2.0.bb           |   2 +-
>  ...ped-minimum-setuptools-version-to-83.patch |  42 +
>  ...jango_6.0.7.bb =3D> python3-django_6.0.8.bb} |   3 +-
>  .../python/python3-eventlet_0.41.0.bb         |   2 +
>  .../python/python3-flask-login_0.6.3.bb       |   2 +-
>  .../python/python3-flask-mail_0.10.0.bb       |   2 +-
>  .../python/python3-flask-user_0.6.19.bb       |   4 +-
>  .../python/python3-flask_3.1.3.bb             |   2 +-
>  .../python/python3-marshmallow_4.3.0.bb       |   2 +
>  .../python3-pillow/CVE-2026-54058.patch       |  89 ++
>  .../python3-pillow/CVE-2026-59204.patch       |  37 +
>  .../python/python3-pillow_12.2.0.bb           |   2 +
>  .../python/python3-py_1.11.0.bb               |   2 +-
>  .../python/python3-pyexpect_1.0.22.bb         |   2 +-
>  .../python3-sqlparse/CVE-2026-54284-1.patch   |  37 +
>  .../python3-sqlparse/CVE-2026-54284-2.patch   | 144 ++++
>  .../python3-sqlparse/CVE-2026-59893.patch     | 293 +++++++
>  .../python3-sqlparse/CVE-2026-59894.patch     |  79 ++
>  .../python3-sqlparse/CVE-2026-71491.patch     | 147 ++++
>  .../python/python3-sqlparse_0.5.5.bb          |   7 +
>  .../python3-tornado/CVE-2026-82397.patch      | 149 ++++
>  .../python3-tornado/CVE-2026-91990.patch      |  40 +
>  .../python3-tornado/CVE-2026-91991.patch      |  57 ++
>  .../python/python3-tornado_6.5.7.bb           |   9 +
>  .../python/python3-twisted_25.5.0.bb          |   2 +-
>  .../python/python3-twitter_4.16.0.bb          |   2 +-
>  ...ata_2026.3.bb =3D> python3-tzdata_2026.4.bb} |   2 +-
>  .../python/python3-ujson_5.12.1.bb            |   2 +
>  .../python/python3-waitress_3.0.2.bb          |   2 +-
>  .../python/python3-werkzeug_3.1.8.bb          |   2 +-
>  .../python/python3-ldap_3.4.5.bb              |   2 +-
>  129 files changed, 8725 insertions(+), 189 deletions(-)
>  create mode 100644
> meta-multimedia/recipes-multimedia/libde265/libde265/CVE-2026-54240-CVE-2=
026-54241.patch
>  rename meta-multimedia/recipes-multimedia/libopenmpt/{libopenmpt_0.8.4.b=
b
> =3D> libopenmpt_0.8.6.bb} (95%)
>  rename meta-networking/recipes-connectivity/nanomsg/{nanomsg_1.2.2.bb =
=3D>
> nanomsg_1.2.5.bb} (94%)
>  create mode 100644
> meta-networking/recipes-support/ntopng/files/CVE-2026-84990.patch
>  create mode 100644
> meta-networking/recipes-support/ntopng/files/CVE-2026-86090-CVE-2026-8609=
1.patch
>  delete mode 100644
> meta-networking/recipes-support/openvpn/openvpn/0001-tests-skip-test-exec=
ution-when-cross-compiling.patch
>  delete mode 100644
> meta-networking/recipes-support/openvpn/openvpn/CVE-2026-13117.patch
>  delete mode 100644
> meta-networking/recipes-support/openvpn/openvpn/CVE-2026-40215.patch
>  rename meta-networking/recipes-support/openvpn/{openvpn_2.7.0.bb =3D>
> openvpn_2.7.5.bb} (94%)
>  create mode 100644
> meta-networking/recipes-support/sngrep/sngrep/CVE-2026-90558.patch
>  create mode 100644
> meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78123.patc=
h
>  create mode 100644
> meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78124.patc=
h
>  create mode 100644
> meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78126.patc=
h
>  create mode 100644
> meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78127.patc=
h
>  create mode 100644
> meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78129.patc=
h
>  create mode 100644
> meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78130.patc=
h
>  create mode 100644
> meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78131.patc=
h
>  create mode 100644
> meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78132.patc=
h
>  create mode 100644
> meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78133.patc=
h
>  create mode 100644
> meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78134.patc=
h
>  create mode 100644
> meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78135.patc=
h
>  create mode 100644
> meta-networking/recipes-support/unbound/unbound/CVE-2026-77860.patch
>  create mode 100644
> meta-networking/recipes-support/unbound/unbound/CVE-2026-78227.patch
>  create mode 100644
> meta-networking/recipes-support/unbound/unbound/CVE-2026-80225.patch
>  create mode 100644
> meta-networking/recipes-support/unbound/unbound/CVE-2026-81642.patch
>  create mode 100644
> meta-oe/recipes-connectivity/libwebsockets/libwebsockets/CVE-2026-19773.p=
atch
>  create mode 100644
> meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c/CVE-2026-44236.patch
>  create mode 100644
> meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0003-hash-restrict-x86-AES=
-SIMD-path-to-64-bit-targets.patch
>  create mode 100644
> meta-oe/recipes-devtools/cjson/cjson/CVE-2026-87933.patch
>  create mode 100644
> meta-oe/recipes-devtools/flatcc/flatcc/CVE-2026-90785.patch
>  create mode 100644
> meta-oe/recipes-devtools/flatcc/flatcc/CVE-2026-90786.patch
>  create mode 100644
> meta-oe/recipes-devtools/msgpack/msgpack-c/CVE-2026-72854.patch
>  rename meta-oe/recipes-devtools/nodejs/{nodejs_22.23.2.bb =3D>
> nodejs_22.23.3.bb} (99%)
>  rename meta-oe/recipes-devtools/php/{php_8.5.10.bb =3D> php_8.5.11.bb}
> (99%)
>  create mode 100644
> meta-oe/recipes-extended/polkit/files/CVE-2026-4897-01.patch
>  create mode 100644
> meta-oe/recipes-extended/polkit/files/CVE-2026-4897-02.patch
>  create mode 100644
> meta-oe/recipes-extended/polkit/files/CVE-2026-85498.patch
>  create mode 100644
> meta-oe/recipes-extended/redis/redis-8.0.6/CVE-2026-81934.patch
>  rename meta-oe/recipes-extended/valkey/{valkey_9.0.5.bb =3D>
> valkey_9.0.6.bb} (96%)
>  create mode 100644
> meta-oe/recipes-graphics/tesseract/tesseract/CVE-2026-88047.patch
>  create mode 100644
> meta-oe/recipes-graphics/tesseract/tesseract/CVE-2026-88048.patch
>  create mode 100644
> meta-oe/recipes-graphics/tesseract/tesseract/CVE-2026-88049.patch
>  create mode 100644
> meta-oe/recipes-graphics/tesseract/tesseract/CVE-2026-88050.patch
>  create mode 100644
> meta-oe/recipes-graphics/tesseract/tesseract/CVE-2026-88051.patch
>  create mode 100644
> meta-oe/recipes-graphics/tesseract/tesseract/CVE-2026-88052.patch
>  create mode 100644
> meta-oe/recipes-graphics/tesseract/tesseract/CVE-2026-88054.patch
>  rename meta-oe/recipes-multimedia/faad2/{faad2_2.11.2.bb =3D>
> faad2_2.11.3.bb} (81%)
>  create mode 100644
> meta-oe/recipes-navigation/gpsd/gpsd/CVE-2026-60122.patch
>  create mode 100644
> meta-oe/recipes-support/freeipmi/freeipmi/CVE-2026-85504.patch
>  create mode 100644
> meta-oe/recipes-support/freeipmi/freeipmi/CVE-2026-85505.patch
>  create mode 100644
> meta-oe/recipes-support/freeipmi/freeipmi/CVE-2026-85506.patch
>  create mode 100644
> meta-oe/recipes-support/freeipmi/freeipmi/CVE-2026-85507.patch
>  create mode 100644
> meta-oe/recipes-support/freeipmi/freeipmi/CVE-2026-85508.patch
>  create mode 100644
> meta-oe/recipes-support/freeipmi/freeipmi/CVE-2026-85509.patch
>  create mode 100644
> meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-85089-1.patch
>  create mode 100644
> meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-85089-2.patch
>  create mode 100644
> meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-85090.patch
>  rename meta-oe/recipes-support/libmxml/{libmxml_4.0.4.bb =3D>
> libmxml_4.0.5.bb} (92%)
>  create mode 100644
> meta-oe/recipes-support/syslog-ng/files/CVE-2026-39879-01.patch
>  create mode 100644
> meta-oe/recipes-support/syslog-ng/files/CVE-2026-39879-02.patch
>  create mode 100644
> meta-oe/recipes-support/syslog-ng/files/CVE-2026-39879-03.patch
>  create mode 100644
> meta-oe/recipes-support/syslog-ng/files/CVE-2026-39879-04.patch
>  create mode 100644
> meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/0001-vboxvideo-=
let-the-build-decide-if-drm_fb_helper_alloc.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-django/0001-Revert-Bumped-min=
imum-setuptools-version-to-83.patch
>  rename meta-python/recipes-devtools/python/{python3-django_6.0.7.bb =3D>
> python3-django_6.0.8.bb} (62%)
>  create mode 100644
> meta-python/recipes-devtools/python/python3-pillow/CVE-2026-54058.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-pillow/CVE-2026-59204.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-sqlparse/CVE-2026-54284-1.pat=
ch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-sqlparse/CVE-2026-54284-2.pat=
ch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-sqlparse/CVE-2026-59893.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-sqlparse/CVE-2026-59894.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-sqlparse/CVE-2026-71491.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-tornado/CVE-2026-82397.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-tornado/CVE-2026-91990.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-tornado/CVE-2026-91991.patch
>  rename meta-python/recipes-devtools/python/{python3-tzdata_2026.3.bb =3D=
>
> python3-tzdata_2026.4.bb} (86%)
>
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#130763):
> https://lists.openembedded.org/g/openembedded-devel/message/130763
> Mute This Topic: https://lists.openembedded.org/mt/121716184/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000ea8c66065dab3fe2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Looks good. Applied now thanks Anuj</div><br><div class=3D=
"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">O=
n Mon, Oct 12, 2026 at 7:51=E2=80=AFAM Anuj Mittal via <a href=3D"http://li=
sts.openembedded.org">lists.openembedded.org</a> &lt;anuj.mittal=3D<a href=
=3D"mailto:oss.qualcomm.com@lists.openembedded.org">oss.qualcomm.com@lists.=
openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">Please merge these changes in wrynose. Tested locally and o=
n autobuilder.<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/113/bui=
lds/1773" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctopro=
ject.org/valkyrie/#/builders/113/builds/1773</a><br>
<br>
The following changes since commit 47d7dbdd10890bbd429bc0cccbe14435c37e5af1=
:<br>
<br>
=C2=A0 unbound: patch CVE-2026-56444 (2026-09-15 10:14:05 +0530)<br>
<br>
are available in the Git repository at:<br>
<br>
=C2=A0 <a href=3D"https://git.openembedded.org/meta-openembedded-contrib" r=
el=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/meta-opene=
mbedded-contrib</a> anujm/wrynose<br>
=C2=A0 <a href=3D"https://git.openembedded.org/meta-openembedded-contrib/lo=
g/?h=3Danujm/wrynose" rel=3D"noreferrer" target=3D"_blank">https://git.open=
embedded.org/meta-openembedded-contrib/log/?h=3Danujm/wrynose</a><br>
<br>
for you to fetch changes up to f28a144aa0a0ae05ca2ee91e1aef6aa05f6a12db:<br=
>
<br>
=C2=A0 vboxguestdrivers: fix vboxvideo build on kernels lacking drm_fb_help=
er_alloc_info (2026-10-06 13:52:06 +0530)<br>
<br>
----------------------------------------------------------------<br>
<br>
Ankur Tyagi (63):<br>
=C2=A0 python3-django: upgrade 6.0.7 -&gt; 6.0.8<br>
=C2=A0 python3-eventlet: mark CVE-2023-29483 fixed<br>
=C2=A0 python3-marshmallow: mark CVE-2025-68480 fixed<br>
=C2=A0 python3-sqlparse: patch CVE-2026-54284<br>
=C2=A0 python3-sqlparse: patch CVE-2026-59893<br>
=C2=A0 python3-sqlparse: patch CVE-2026-59894<br>
=C2=A0 python3-sqlparse: patch CVE-2026-71491<br>
=C2=A0 python3-tornado: mark CVEs fixed<br>
=C2=A0 c-ares: mark CVEs fixed<br>
=C2=A0 cjose: mark CVE-2026-53938 and CVE-2026-53939 fixed<br>
=C2=A0 cjson: patch CVE-2026-87933<br>
=C2=A0 colord: ignore CVE-2026-85062<br>
=C2=A0 flatcc: patch CVE-2026-90786<br>
=C2=A0 flatcc: patch CVE-2026-90785<br>
=C2=A0 fluidsynth: mark CVEs fixed<br>
=C2=A0 freeipmi: patch CVE-2026-85509<br>
=C2=A0 freeipmi: patch CVE-2026-85508<br>
=C2=A0 freeipmi: patch CVE-2026-85507<br>
=C2=A0 freeipmi: patch CVE-2026-85506<br>
=C2=A0 freeipmi: patch CVE-2026-85505<br>
=C2=A0 freeipmi: patch CVE-2026-85504<br>
=C2=A0 libde265: patch CVE-2026-54240 and CVE-2026-54241<br>
=C2=A0 libheif: ignore CVE-2026-84383<br>
=C2=A0 libwebsockets: patch CVE-2026-19773<br>
=C2=A0 libopenmpt: upgrade 0.8.4 -&gt; 0.8.6<br>
=C2=A0 smarty: mark CVEs patched<br>
=C2=A0 libssh: ignore CVE-2026-59842<br>
=C2=A0 ntopng: ignore CVE-2026-84989<br>
=C2=A0 ntopng: patch CVE-2026-84990<br>
=C2=A0 ntopng: patch CVE-2026-86090 and CVE-2026-86091<br>
=C2=A0 rabbitmq-c: patch CVE-2026-44236<br>
=C2=A0 redis: patch CVE-2026-81934<br>
=C2=A0 sngrep: patch CVE-2026-90558<br>
=C2=A0 strongswan: patch CVE-2026-78123<br>
=C2=A0 strongswan: patch CVE-2026-78124<br>
=C2=A0 strongswan: patch CVE-2026-78126<br>
=C2=A0 strongswan: patch CVE-2026-78127<br>
=C2=A0 strongswan: patch CVE-2026-78129<br>
=C2=A0 strongswan: patch CVE-2026-78133<br>
=C2=A0 strongswan: patch CVE-2026-78131<br>
=C2=A0 strongswan: patch CVE-2026-78130<br>
=C2=A0 strongswan: patch CVE-2026-78132<br>
=C2=A0 strongswan: patch CVE-2026-78135<br>
=C2=A0 strongswan: patch CVE-2026-78134<br>
=C2=A0 tesseract: patch CVE-2026-88052<br>
=C2=A0 tesseract: patch CVE-2026-88048<br>
=C2=A0 tesseract: patch CVE-2026-88049<br>
=C2=A0 tesseract: patch CVE-2026-88050<br>
=C2=A0 tesseract: patch CVE-2026-88047<br>
=C2=A0 tesseract: patch CVE-2026-88051<br>
=C2=A0 tesseract: patch CVE-2026-88054<br>
=C2=A0 valkey: upgrade 9.0.5 -&gt; 9.0.6<br>
=C2=A0 valkey: mark CVE-2026-86227 fixed<br>
=C2=A0 unbound: patch CVE-2026-80225<br>
=C2=A0 unbound: patch CVE-2026-81642<br>
=C2=A0 unbound: patch CVE-2026-78227<br>
=C2=A0 unbound: patch CVE-2026-77860<br>
=C2=A0 python3-tornado: patch CVE-2026-91990<br>
=C2=A0 python3-tornado: patch CVE-2026-82397<br>
=C2=A0 python3-tornado: patch CVE-2026-91991<br>
=C2=A0 freerdp3: patch CVE-2026-85089<br>
=C2=A0 freerdp3: patch CVE-2026-85090<br>
=C2=A0 gpsd: patch CVE-2026-60122<br>
<br>
Anuj Mittal (1):<br>
=C2=A0 vboxguestdrivers: fix vboxvideo build on kernels lacking<br>
=C2=A0 =C2=A0 drm_fb_helper_alloc_info<br>
<br>
Aravind Bandari (2):<br>
=C2=A0 python3-pillow: fix CVE-2026-54058<br>
=C2=A0 python3-pillow: fix CVE-2026-59204<br>
<br>
Devansh Patel (16):<br>
=C2=A0 python3-py: correct CVE_PRODUCT mapping<br>
=C2=A0 ldns: correct CVE_PRODUCT mapping<br>
=C2=A0 dnsmasq: correct CVE_PRODUCT mapping<br>
=C2=A0 jq: correct CVE_PRODUCT mapping<br>
=C2=A0 python3-twisted: correct CVE_PRODUCT mapping<br>
=C2=A0 php: correct CVE_PRODUCT mapping<br>
=C2=A0 python3-ldap: correct python-ldap CVE_PRODUCT mapping<br>
=C2=A0 mariadb: correct CVE_PRODUCT mapping<br>
=C2=A0 libssh: correct CVE_PRODUCT mapping<br>
=C2=A0 python3-flask-user: correct CVE_PRODUCT mapping<br>
=C2=A0 python3-aiohttp: correct CVE_PRODUCT mapping<br>
=C2=A0 python3-werkzeug: correct CVE_PRODUCT mapping<br>
=C2=A0 python3-flask: correct CVE_PRODUCT mapping<br>
=C2=A0 python3-twitter: correct Tweepy CVE_PRODUCT mapping<br>
=C2=A0 python3-ujson: add CVE_PRODUCT mapping<br>
=C2=A0 python3-waitress: correct CVE_PRODUCT mapping<br>
<br>
Jaipaul Cheernam (1):<br>
=C2=A0 abseil-cpp: fix 32-bit x86 build of hash.cc<br>
<br>
Jason Schonberg (2):<br>
=C2=A0 nodejs: upgrade 22.23.2 -&gt; 22.23.3<br>
=C2=A0 php: upgrade 8.5.10 -&gt; 8.5.11<br>
<br>
Khem Raj (1):<br>
=C2=A0 openvpn: upgrade 2.7.0 -&gt; 2.7.5<br>
<br>
Leon Anavi (1):<br>
=C2=A0 python3-tzdata: Upgrade 2026.3 -&gt; 2026.4<br>
<br>
Louis Rannou (1):<br>
=C2=A0 openvpn: create an extra package for the dns-updown script<br>
<br>
Mehmet Fide (1):<br>
=C2=A0 spidev-test: clean the build dir before configure<br>
<br>
Nate Kent (1):<br>
=C2=A0 nanomsg: upgrade 1.2.4 -&gt; 1.2.5<br>
<br>
Peter Marko (4):<br>
=C2=A0 msgpack-c: patch CVE-2026-72854<br>
=C2=A0 recipes: correct homepage<br>
=C2=A0 polkit: patch CVE-2026-4897 and CVE-2026-85498<br>
=C2=A0 syslog-ng: patch CVE-2026-39879<br>
<br>
Sana Kazi (1):<br>
=C2=A0 avro-c++: Use fmt from oe-core instead of bundling fmt 10.2.1<br>
<br>
Viswanath Kraleti (1):<br>
=C2=A0 libfastjson: switch git branch from master to main<br>
<br>
Wang Mingyu (3):<br>
=C2=A0 faad2: upgrade 2.11.2 -&gt; 2.11.3<br>
=C2=A0 libmxml: upgrade 4.0.4 -&gt; 4.0.5<br>
=C2=A0 nanomsg: upgrade 1.2.2 -&gt; 1.2.4<br>
<br>
=C2=A0.../fluidsynth/<a href=3D"http://fluidsynth_2.5.7.bb" rel=3D"noreferr=
er" target=3D"_blank">fluidsynth_2.5.7.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A06 +<br>
=C2=A0.../CVE-2026-54240-CVE-2026-54241.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0| 4=
26 ++++++++++<br>
=C2=A0.../libde265/<a href=3D"http://libde265_1.0.19.bb" rel=3D"noreferrer"=
 target=3D"_blank">libde265_1.0.19.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
=C2=A0.../libheif/<a href=3D"http://libheif_1.21.2.bb" rel=3D"noreferrer" t=
arget=3D"_blank">libheif_1.21.2.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +<br>
=C2=A0...<a href=3D"http://ibopenmpt_0.8.4.bb" rel=3D"noreferrer" target=3D=
"_blank">ibopenmpt_0.8.4.bb</a> =3D&gt; <a href=3D"http://libopenmpt_0.8.6.=
bb" rel=3D"noreferrer" target=3D"_blank">libopenmpt_0.8.6.bb</a>} |=C2=A0 =
=C2=A04 +-<br>
=C2=A0.../{<a href=3D"http://nanomsg_1.2.2.bb" rel=3D"noreferrer" target=3D=
"_blank">nanomsg_1.2.2.bb</a> =3D&gt; <a href=3D"http://nanomsg_1.2.5.bb" r=
el=3D"noreferrer" target=3D"_blank">nanomsg_1.2.5.bb</a>}=C2=A0 =C2=A0 |=C2=
=A0 =C2=A04 +-<br>
=C2=A0.../recipes-support/dnsmasq/<a href=3D"http://dnsmasq_2.93.bb" rel=3D=
"noreferrer" target=3D"_blank">dnsmasq_2.93.bb</a>=C2=A0 =C2=A0|=C2=A0 =C2=
=A02 +<br>
=C2=A0.../ntopng/files/CVE-2026-84990.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 53 ++<br>
=C2=A0.../files/CVE-2026-86090-CVE-2026-86091.patch |=C2=A0 67 ++<br>
=C2=A0.../recipes-support/ntopng/<a href=3D"http://ntopng_6.6.bb" rel=3D"no=
referrer" target=3D"_blank">ntopng_6.6.bb</a>=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A04 +<br>
=C2=A0...-test-execution-when-cross-compiling.patch |=C2=A0 34 -<br>
=C2=A0.../openvpn/openvpn/CVE-2026-13117.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
46 --<br>
=C2=A0.../openvpn/openvpn/CVE-2026-40215.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
59 --<br>
=C2=A0.../{<a href=3D"http://openvpn_2.7.0.bb" rel=3D"noreferrer" target=3D=
"_blank">openvpn_2.7.0.bb</a> =3D&gt; <a href=3D"http://openvpn_2.7.5.bb" r=
el=3D"noreferrer" target=3D"_blank">openvpn_2.7.5.bb</a>}=C2=A0 =C2=A0 |=C2=
=A0 10 +-<br>
=C2=A0.../sngrep/sngrep/CVE-2026-90558.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 84 ++<br>
=C2=A0.../recipes-support/sngrep/<a href=3D"http://sngrep_1.8.2.bb" rel=3D"=
noreferrer" target=3D"_blank">sngrep_1.8.2.bb</a>=C2=A0 =C2=A0 |=C2=A0 =C2=
=A04 +-<br>
=C2=A0.../strongswan/CVE-2026-78123.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 51 ++<br>
=C2=A0.../strongswan/CVE-2026-78124.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 34 +<br>
=C2=A0.../strongswan/CVE-2026-78126.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 37 +<br>
=C2=A0.../strongswan/CVE-2026-78127.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 115 +++<br>
=C2=A0.../strongswan/CVE-2026-78129.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 155 ++++<br>
=C2=A0.../strongswan/CVE-2026-78130.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 49 ++<br>
=C2=A0.../strongswan/CVE-2026-78131.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 86 ++<br>
=C2=A0.../strongswan/CVE-2026-78132.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 75 ++<br>
=C2=A0.../strongswan/CVE-2026-78133.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 620 ++++++++++++++<br>
=C2=A0.../strongswan/CVE-2026-78134.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 712 ++++++++++++++++<br>
=C2=A0.../strongswan/CVE-2026-78135.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 72 ++<br>
=C2=A0.../strongswan/<a href=3D"http://strongswan_6.0.6.bb" rel=3D"noreferr=
er" target=3D"_blank">strongswan_6.0.6.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 11 +<br>
=C2=A0.../unbound/unbound/CVE-2026-77860.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
31 +<br>
=C2=A0.../unbound/unbound/CVE-2026-78227.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
30 +<br>
=C2=A0.../unbound/unbound/CVE-2026-80225.patch=C2=A0 =C2=A0 =C2=A0 | 286 ++=
+++++<br>
=C2=A0.../unbound/unbound/CVE-2026-81642.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
30 +<br>
=C2=A0.../recipes-support/unbound/<a href=3D"http://unbound_1.24.2.bb" rel=
=3D"noreferrer" target=3D"_blank">unbound_1.24.2.bb</a> |=C2=A0 =C2=A04 +<b=
r>
=C2=A0.../libwebsockets/CVE-2026-19773.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 31 +<br>
=C2=A0.../libwebsockets/<a href=3D"http://libwebsockets_4.5.8.bb" rel=3D"no=
referrer" target=3D"_blank">libwebsockets_4.5.8.bb</a>=C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 =C2=A01 +<br>
=C2=A0.../rabbitmq-c/CVE-2026-44236.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 145 ++++<br>
=C2=A0.../rabbitmq-c/<a href=3D"http://rabbitmq-c_0.15.0.bb" rel=3D"norefer=
rer" target=3D"_blank">rabbitmq-c_0.15.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
=C2=A0meta-oe/recipes-dbs/mysql/<a href=3D"http://mariadb_11.4.12.bb" rel=
=3D"noreferrer" target=3D"_blank">mariadb_11.4.12.bb</a>=C2=A0 |=C2=A0 =C2=
=A02 +<br>
=C2=A0...-x86-AES-SIMD-path-to-64-bit-targets.patch |=C2=A0 34 +<br>
=C2=A0.../abseil-cpp/<a href=3D"http://abseil-cpp_20260107.1.bb" rel=3D"nor=
eferrer" target=3D"_blank">abseil-cpp_20260107.1.bb</a>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 =C2=A01 +<br>
=C2=A0.../cjson/cjson/CVE-2026-87933.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 110 +++<br>
=C2=A0.../recipes-devtools/cjson/<a href=3D"http://cjson_1.7.19.bb" rel=3D"=
noreferrer" target=3D"_blank">cjson_1.7.19.bb</a>=C2=A0 =C2=A0 |=C2=A0 =C2=
=A01 +<br>
=C2=A0.../flatcc/flatcc/CVE-2026-90785.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 29 +<br>
=C2=A0.../flatcc/flatcc/CVE-2026-90786.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 40 +<br>
=C2=A0meta-oe/recipes-devtools/flatcc/<a href=3D"http://flatcc_git.bb" rel=
=3D"noreferrer" target=3D"_blank">flatcc_git.bb</a> |=C2=A0 =C2=A02 +<br>
=C2=A0meta-oe/recipes-devtools/jq/<a href=3D"http://jq_1.8.1.bb" rel=3D"nor=
eferrer" target=3D"_blank">jq_1.8.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 =C2=A02 +<br>
=C2=A0meta-oe/recipes-devtools/ldns/<a href=3D"http://ldns_1.9.2.bb" rel=3D=
"noreferrer" target=3D"_blank">ldns_1.9.2.bb</a>=C2=A0 =C2=A0|=C2=A0 =C2=A0=
2 +<br>
=C2=A0.../msgpack/msgpack-c/CVE-2026-72854.patch=C2=A0 =C2=A0 | 127 +++<br>
=C2=A0.../msgpack/<a href=3D"http://msgpack-c_6.1.0.bb" rel=3D"noreferrer" =
target=3D"_blank">msgpack-c_6.1.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A04 +-<br>
=C2=A0.../{<a href=3D"http://nodejs_22.23.2.bb" rel=3D"noreferrer" target=
=3D"_blank">nodejs_22.23.2.bb</a> =3D&gt; <a href=3D"http://nodejs_22.23.3.=
bb" rel=3D"noreferrer" target=3D"_blank">nodejs_22.23.3.bb</a>}=C2=A0 |=C2=
=A0 =C2=A02 +-<br>
=C2=A0.../php/{<a href=3D"http://php_8.5.10.bb" rel=3D"noreferrer" target=
=3D"_blank">php_8.5.10.bb</a> =3D&gt; <a href=3D"http://php_8.5.11.bb" rel=
=3D"noreferrer" target=3D"_blank">php_8.5.11.bb</a>}=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A04 +-<br>
=C2=A0.../polkit/files/CVE-2026-4897-01.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 64 ++<br>
=C2=A0.../polkit/files/CVE-2026-4897-02.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 32 +<br>
=C2=A0.../polkit/files/CVE-2026-85498.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 38 +<br>
=C2=A0meta-oe/recipes-extended/polkit/<a href=3D"http://polkit_127.bb" rel=
=3D"noreferrer" target=3D"_blank">polkit_127.bb</a> |=C2=A0 =C2=A07 +-<br>
=C2=A0.../redis/redis-8.0.6/CVE-2026-81934.patch=C2=A0 =C2=A0 |=C2=A0 53 ++=
<br>
=C2=A0meta-oe/recipes-extended/redis/<a href=3D"http://redis_8.0.6.bb" rel=
=3D"noreferrer" target=3D"_blank">redis_8.0.6.bb</a> |=C2=A0 =C2=A01 +<br>
=C2=A0.../rsyslog/<a href=3D"http://libfastjson_1.2304.0.bb" rel=3D"norefer=
rer" target=3D"_blank">libfastjson_1.2304.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0.../{<a href=3D"http://valkey_9.0.5.bb" rel=3D"noreferrer" target=3D"=
_blank">valkey_9.0.5.bb</a> =3D&gt; <a href=3D"http://valkey_9.0.6.bb" rel=
=3D"noreferrer" target=3D"_blank">valkey_9.0.6.bb</a>}=C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 =C2=A03 +-<br>
=C2=A0.../tesseract/tesseract/CVE-2026-88047.patch=C2=A0 | 226 ++++++<br>
=C2=A0.../tesseract/tesseract/CVE-2026-88048.patch=C2=A0 | 228 ++++++<br>
=C2=A0.../tesseract/tesseract/CVE-2026-88049.patch=C2=A0 | 316 ++++++++<br>
=C2=A0.../tesseract/tesseract/CVE-2026-88050.patch=C2=A0 | 210 +++++<br>
=C2=A0.../tesseract/tesseract/CVE-2026-88051.patch=C2=A0 | 185 +++++<br>
=C2=A0.../tesseract/tesseract/CVE-2026-88052.patch=C2=A0 | 165 ++++<br>
=C2=A0.../tesseract/tesseract/CVE-2026-88054.patch=C2=A0 | 275 +++++++<br>
=C2=A0.../tesseract/<a href=3D"http://tesseract_5.5.2.bb" rel=3D"noreferrer=
" target=3D"_blank">tesseract_5.5.2.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A07 +<br>
=C2=A0.../recipes-kernel/spidev-test/<a href=3D"http://spidev-test.bb" rel=
=3D"noreferrer" target=3D"_blank">spidev-test.bb</a> |=C2=A0 =C2=A01 +<br>
=C2=A0.../{<a href=3D"http://faad2_2.11.2.bb" rel=3D"noreferrer" target=3D"=
_blank">faad2_2.11.2.bb</a> =3D&gt; <a href=3D"http://faad2_2.11.3.bb" rel=
=3D"noreferrer" target=3D"_blank">faad2_2.11.3.bb</a>}=C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 =C2=A06 +-<br>
=C2=A0.../gpsd/gpsd/CVE-2026-60122.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 45 ++<br>
=C2=A0.../recipes-navigation/gpsd/<a href=3D"http://gpsd_3.27.5.bb" rel=3D"=
noreferrer" target=3D"_blank">gpsd_3.27.5.bb</a>=C2=A0 =C2=A0 |=C2=A0 =C2=
=A01 +<br>
=C2=A0.../recipes-support/avro/avro-c++_<a href=3D"http://1.12.1.bb" rel=3D=
"noreferrer" target=3D"_blank">1.12.1.bb</a>=C2=A0 =C2=A0|=C2=A0 10 +-<br>
=C2=A0.../recipes-support/c-ares/<a href=3D"http://c-ares_1.34.8.bb" rel=3D=
"noreferrer" target=3D"_blank">c-ares_1.34.8.bb</a>=C2=A0 =C2=A0|=C2=A0 =C2=
=A03 +<br>
=C2=A0.../recipes-support/cjose/<a href=3D"http://cjose_0.6.2.8.bb" rel=3D"=
noreferrer" target=3D"_blank">cjose_0.6.2.8.bb</a>=C2=A0 =C2=A0 |=C2=A0 =C2=
=A02 +<br>
=C2=A0meta-oe/recipes-support/colord/<a href=3D"http://colord.bb" rel=3D"no=
referrer" target=3D"_blank">colord.bb</a>=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=
=A01 +<br>
=C2=A0.../freeipmi/freeipmi/CVE-2026-85504.patch=C2=A0 =C2=A0 |=C2=A0 93 ++=
+<br>
=C2=A0.../freeipmi/freeipmi/CVE-2026-85505.patch=C2=A0 =C2=A0 |=C2=A0 49 ++=
<br>
=C2=A0.../freeipmi/freeipmi/CVE-2026-85506.patch=C2=A0 =C2=A0 |=C2=A0 51 ++=
<br>
=C2=A0.../freeipmi/freeipmi/CVE-2026-85507.patch=C2=A0 =C2=A0 |=C2=A0 50 ++=
<br>
=C2=A0.../freeipmi/freeipmi/CVE-2026-85508.patch=C2=A0 =C2=A0 |=C2=A0 51 ++=
<br>
=C2=A0.../freeipmi/freeipmi/CVE-2026-85509.patch=C2=A0 =C2=A0 |=C2=A0 54 ++=
<br>
=C2=A0.../freeipmi/<a href=3D"http://freeipmi_1.6.17.bb" rel=3D"noreferrer"=
 target=3D"_blank">freeipmi_1.6.17.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A06 +<br>
=C2=A0.../freerdp/freerdp3/CVE-2026-85089-1.patch=C2=A0 =C2=A0|=C2=A0 28 +<=
br>
=C2=A0.../freerdp/freerdp3/CVE-2026-85089-2.patch=C2=A0 =C2=A0|=C2=A0 28 +<=
br>
=C2=A0.../freerdp/freerdp3/CVE-2026-85090.patch=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
59 ++<br>
=C2=A0.../freerdp/<a href=3D"http://freerdp3_3.24.2.bb" rel=3D"noreferrer" =
target=3D"_blank">freerdp3_3.24.2.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A03 +<br>
=C2=A0.../{<a href=3D"http://libmxml_4.0.4.bb" rel=3D"noreferrer" target=3D=
"_blank">libmxml_4.0.4.bb</a> =3D&gt; <a href=3D"http://libmxml_4.0.5.bb" r=
el=3D"noreferrer" target=3D"_blank">libmxml_4.0.5.bb</a>}=C2=A0 =C2=A0 |=C2=
=A0 =C2=A04 +-<br>
=C2=A0.../recipes-support/libssh/<a href=3D"http://libssh_0.11.5.bb" rel=3D=
"noreferrer" target=3D"_blank">libssh_0.11.5.bb</a>=C2=A0 =C2=A0|=C2=A0 =C2=
=A02 +<br>
=C2=A0.../recipes-support/smarty/<a href=3D"http://smarty_5.8.4.bb" rel=3D"=
noreferrer" target=3D"_blank">smarty_5.8.4.bb</a>=C2=A0 =C2=A0 |=C2=A0 =C2=
=A04 +<br>
=C2=A0.../syslog-ng/files/CVE-2026-39879-01.patch=C2=A0 =C2=A0|=C2=A0 65 ++=
<br>
=C2=A0.../syslog-ng/files/CVE-2026-39879-02.patch=C2=A0 =C2=A0| 572 +++++++=
++++++<br>
=C2=A0.../syslog-ng/files/CVE-2026-39879-03.patch=C2=A0 =C2=A0| 758 +++++++=
+++++++++++<br>
=C2=A0.../syslog-ng/files/CVE-2026-39879-04.patch=C2=A0 =C2=A0| 176 ++++<br=
>
=C2=A0.../syslog-ng/<a href=3D"http://syslog-ng_4.11.0.bb" rel=3D"noreferre=
r" target=3D"_blank">syslog-ng_4.11.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A04 +<br>
=C2=A0...-build-decide-if-drm_fb_helper_alloc.patch |=C2=A0 52 ++<br>
=C2=A0.../<a href=3D"http://vboxguestdrivers_7.2.8.bb" rel=3D"noreferrer" t=
arget=3D"_blank">vboxguestdrivers_7.2.8.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A09 +-<br>
=C2=A0.../python/<a href=3D"http://python3-aiohttp_3.13.5.bb" rel=3D"norefe=
rrer" target=3D"_blank">python3-aiohttp_3.13.5.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0.../python/<a href=3D"http://python3-beautifulsoup4_4.14.3.bb" rel=3D=
"noreferrer" target=3D"_blank">python3-beautifulsoup4_4.14.3.bb</a>=C2=A0 =
=C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0.../python/<a href=3D"http://python3-colorzero_2.0.bb" rel=3D"norefer=
rer" target=3D"_blank">python3-colorzero_2.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0...ped-minimum-setuptools-version-to-83.patch |=C2=A0 42 +<br>
=C2=A0...<a href=3D"http://jango_6.0.7.bb" rel=3D"noreferrer" target=3D"_bl=
ank">jango_6.0.7.bb</a> =3D&gt; <a href=3D"http://python3-django_6.0.8.bb" =
rel=3D"noreferrer" target=3D"_blank">python3-django_6.0.8.bb</a>} |=C2=A0 =
=C2=A03 +-<br>
=C2=A0.../python/<a href=3D"http://python3-eventlet_0.41.0.bb" rel=3D"noref=
errer" target=3D"_blank">python3-eventlet_0.41.0.bb</a>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +<br>
=C2=A0.../python/<a href=3D"http://python3-flask-login_0.6.3.bb" rel=3D"nor=
eferrer" target=3D"_blank">python3-flask-login_0.6.3.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0.../python/<a href=3D"http://python3-flask-mail_0.10.0.bb" rel=3D"nor=
eferrer" target=3D"_blank">python3-flask-mail_0.10.0.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0.../python/<a href=3D"http://python3-flask-user_0.6.19.bb" rel=3D"nor=
eferrer" target=3D"_blank">python3-flask-user_0.6.19.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A04 +-<br>
=C2=A0.../python/<a href=3D"http://python3-flask_3.1.3.bb" rel=3D"noreferre=
r" target=3D"_blank">python3-flask_3.1.3.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0.../python/<a href=3D"http://python3-marshmallow_4.3.0.bb" rel=3D"nor=
eferrer" target=3D"_blank">python3-marshmallow_4.3.0.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A02 +<br>
=C2=A0.../python3-pillow/CVE-2026-54058.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 89 ++<br>
=C2=A0.../python3-pillow/CVE-2026-59204.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 37 +<br>
=C2=A0.../python/<a href=3D"http://python3-pillow_12.2.0.bb" rel=3D"norefer=
rer" target=3D"_blank">python3-pillow_12.2.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +<br>
=C2=A0.../python/<a href=3D"http://python3-py_1.11.0.bb" rel=3D"noreferrer"=
 target=3D"_blank">python3-py_1.11.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0.../python/<a href=3D"http://python3-pyexpect_1.0.22.bb" rel=3D"noref=
errer" target=3D"_blank">python3-pyexpect_1.0.22.bb</a>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0.../python3-sqlparse/CVE-2026-54284-1.patch=C2=A0 =C2=A0|=C2=A0 37 +<=
br>
=C2=A0.../python3-sqlparse/CVE-2026-54284-2.patch=C2=A0 =C2=A0| 144 ++++<br=
>
=C2=A0.../python3-sqlparse/CVE-2026-59893.patch=C2=A0 =C2=A0 =C2=A0| 293 ++=
+++++<br>
=C2=A0.../python3-sqlparse/CVE-2026-59894.patch=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
79 ++<br>
=C2=A0.../python3-sqlparse/CVE-2026-71491.patch=C2=A0 =C2=A0 =C2=A0| 147 ++=
++<br>
=C2=A0.../python/<a href=3D"http://python3-sqlparse_0.5.5.bb" rel=3D"norefe=
rrer" target=3D"_blank">python3-sqlparse_0.5.5.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A07 +<br>
=C2=A0.../python3-tornado/CVE-2026-82397.patch=C2=A0 =C2=A0 =C2=A0 | 149 ++=
++<br>
=C2=A0.../python3-tornado/CVE-2026-91990.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
40 +<br>
=C2=A0.../python3-tornado/CVE-2026-91991.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
57 ++<br>
=C2=A0.../python/<a href=3D"http://python3-tornado_6.5.7.bb" rel=3D"norefer=
rer" target=3D"_blank">python3-tornado_6.5.7.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A09 +<br>
=C2=A0.../python/<a href=3D"http://python3-twisted_25.5.0.bb" rel=3D"norefe=
rrer" target=3D"_blank">python3-twisted_25.5.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0.../python/<a href=3D"http://python3-twitter_4.16.0.bb" rel=3D"norefe=
rrer" target=3D"_blank">python3-twitter_4.16.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0...<a href=3D"http://ata_2026.3.bb" rel=3D"noreferrer" target=3D"_bla=
nk">ata_2026.3.bb</a> =3D&gt; <a href=3D"http://python3-tzdata_2026.4.bb" r=
el=3D"noreferrer" target=3D"_blank">python3-tzdata_2026.4.bb</a>} |=C2=A0 =
=C2=A02 +-<br>
=C2=A0.../python/<a href=3D"http://python3-ujson_5.12.1.bb" rel=3D"noreferr=
er" target=3D"_blank">python3-ujson_5.12.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +<br>
=C2=A0.../python/<a href=3D"http://python3-waitress_3.0.2.bb" rel=3D"norefe=
rrer" target=3D"_blank">python3-waitress_3.0.2.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0.../python/<a href=3D"http://python3-werkzeug_3.1.8.bb" rel=3D"norefe=
rrer" target=3D"_blank">python3-werkzeug_3.1.8.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0.../python/<a href=3D"http://python3-ldap_3.4.5.bb" rel=3D"noreferrer=
" target=3D"_blank">python3-ldap_3.4.5.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0129 files changed, 8725 insertions(+), 189 deletions(-)<br>
=C2=A0create mode 100644 meta-multimedia/recipes-multimedia/libde265/libde2=
65/CVE-2026-54240-CVE-2026-54241.patch<br>
=C2=A0rename meta-multimedia/recipes-multimedia/libopenmpt/{<a href=3D"http=
://libopenmpt_0.8.4.bb" rel=3D"noreferrer" target=3D"_blank">libopenmpt_0.8=
.4.bb</a> =3D&gt; <a href=3D"http://libopenmpt_0.8.6.bb" rel=3D"noreferrer"=
 target=3D"_blank">libopenmpt_0.8.6.bb</a>} (95%)<br>
=C2=A0rename meta-networking/recipes-connectivity/nanomsg/{<a href=3D"http:=
//nanomsg_1.2.2.bb" rel=3D"noreferrer" target=3D"_blank">nanomsg_1.2.2.bb</=
a> =3D&gt; <a href=3D"http://nanomsg_1.2.5.bb" rel=3D"noreferrer" target=3D=
"_blank">nanomsg_1.2.5.bb</a>} (94%)<br>
=C2=A0create mode 100644 meta-networking/recipes-support/ntopng/files/CVE-2=
026-84990.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/ntopng/files/CVE-2=
026-86090-CVE-2026-86091.patch<br>
=C2=A0delete mode 100644 meta-networking/recipes-support/openvpn/openvpn/00=
01-tests-skip-test-execution-when-cross-compiling.patch<br>
=C2=A0delete mode 100644 meta-networking/recipes-support/openvpn/openvpn/CV=
E-2026-13117.patch<br>
=C2=A0delete mode 100644 meta-networking/recipes-support/openvpn/openvpn/CV=
E-2026-40215.patch<br>
=C2=A0rename meta-networking/recipes-support/openvpn/{<a href=3D"http://ope=
nvpn_2.7.0.bb" rel=3D"noreferrer" target=3D"_blank">openvpn_2.7.0.bb</a> =
=3D&gt; <a href=3D"http://openvpn_2.7.5.bb" rel=3D"noreferrer" target=3D"_b=
lank">openvpn_2.7.5.bb</a>} (94%)<br>
=C2=A0create mode 100644 meta-networking/recipes-support/sngrep/sngrep/CVE-=
2026-90558.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/strongswan/strongs=
wan/CVE-2026-78123.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/strongswan/strongs=
wan/CVE-2026-78124.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/strongswan/strongs=
wan/CVE-2026-78126.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/strongswan/strongs=
wan/CVE-2026-78127.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/strongswan/strongs=
wan/CVE-2026-78129.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/strongswan/strongs=
wan/CVE-2026-78130.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/strongswan/strongs=
wan/CVE-2026-78131.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/strongswan/strongs=
wan/CVE-2026-78132.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/strongswan/strongs=
wan/CVE-2026-78133.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/strongswan/strongs=
wan/CVE-2026-78134.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/strongswan/strongs=
wan/CVE-2026-78135.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/unbound/unbound/CV=
E-2026-77860.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/unbound/unbound/CV=
E-2026-78227.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/unbound/unbound/CV=
E-2026-80225.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/unbound/unbound/CV=
E-2026-81642.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-connectivity/libwebsockets/libwebs=
ockets/CVE-2026-19773.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c=
/CVE-2026-44236.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/000=
3-hash-restrict-x86-AES-SIMD-path-to-64-bit-targets.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-devtools/cjson/cjson/CVE-2026-8793=
3.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-devtools/flatcc/flatcc/CVE-2026-90=
785.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-devtools/flatcc/flatcc/CVE-2026-90=
786.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-devtools/msgpack/msgpack-c/CVE-202=
6-72854.patch<br>
=C2=A0rename meta-oe/recipes-devtools/nodejs/{<a href=3D"http://nodejs_22.2=
3.2.bb" rel=3D"noreferrer" target=3D"_blank">nodejs_22.23.2.bb</a> =3D&gt; =
<a href=3D"http://nodejs_22.23.3.bb" rel=3D"noreferrer" target=3D"_blank">n=
odejs_22.23.3.bb</a>} (99%)<br>
=C2=A0rename meta-oe/recipes-devtools/php/{<a href=3D"http://php_8.5.10.bb"=
 rel=3D"noreferrer" target=3D"_blank">php_8.5.10.bb</a> =3D&gt; <a href=3D"=
http://php_8.5.11.bb" rel=3D"noreferrer" target=3D"_blank">php_8.5.11.bb</a=
>} (99%)<br>
=C2=A0create mode 100644 meta-oe/recipes-extended/polkit/files/CVE-2026-489=
7-01.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-extended/polkit/files/CVE-2026-489=
7-02.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-extended/polkit/files/CVE-2026-854=
98.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-extended/redis/redis-8.0.6/CVE-202=
6-81934.patch<br>
=C2=A0rename meta-oe/recipes-extended/valkey/{<a href=3D"http://valkey_9.0.=
5.bb" rel=3D"noreferrer" target=3D"_blank">valkey_9.0.5.bb</a> =3D&gt; <a h=
ref=3D"http://valkey_9.0.6.bb" rel=3D"noreferrer" target=3D"_blank">valkey_=
9.0.6.bb</a>} (96%)<br>
=C2=A0create mode 100644 meta-oe/recipes-graphics/tesseract/tesseract/CVE-2=
026-88047.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-graphics/tesseract/tesseract/CVE-2=
026-88048.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-graphics/tesseract/tesseract/CVE-2=
026-88049.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-graphics/tesseract/tesseract/CVE-2=
026-88050.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-graphics/tesseract/tesseract/CVE-2=
026-88051.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-graphics/tesseract/tesseract/CVE-2=
026-88052.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-graphics/tesseract/tesseract/CVE-2=
026-88054.patch<br>
=C2=A0rename meta-oe/recipes-multimedia/faad2/{<a href=3D"http://faad2_2.11=
.2.bb" rel=3D"noreferrer" target=3D"_blank">faad2_2.11.2.bb</a> =3D&gt; <a =
href=3D"http://faad2_2.11.3.bb" rel=3D"noreferrer" target=3D"_blank">faad2_=
2.11.3.bb</a>} (81%)<br>
=C2=A0create mode 100644 meta-oe/recipes-navigation/gpsd/gpsd/CVE-2026-6012=
2.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/freeipmi/freeipmi/CVE-2026=
-85504.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/freeipmi/freeipmi/CVE-2026=
-85505.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/freeipmi/freeipmi/CVE-2026=
-85506.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/freeipmi/freeipmi/CVE-2026=
-85507.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/freeipmi/freeipmi/CVE-2026=
-85508.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/freeipmi/freeipmi/CVE-2026=
-85509.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-=
85089-1.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-=
85089-2.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-=
85090.patch<br>
=C2=A0rename meta-oe/recipes-support/libmxml/{<a href=3D"http://libmxml_4.0=
.4.bb" rel=3D"noreferrer" target=3D"_blank">libmxml_4.0.4.bb</a> =3D&gt; <a=
 href=3D"http://libmxml_4.0.5.bb" rel=3D"noreferrer" target=3D"_blank">libm=
xml_4.0.5.bb</a>} (92%)<br>
=C2=A0create mode 100644 meta-oe/recipes-support/syslog-ng/files/CVE-2026-3=
9879-01.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/syslog-ng/files/CVE-2026-3=
9879-02.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/syslog-ng/files/CVE-2026-3=
9879-03.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/syslog-ng/files/CVE-2026-3=
9879-04.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/vboxguestdrivers/vboxguest=
drivers/0001-vboxvideo-let-the-build-decide-if-drm_fb_helper_alloc.patch<br=
>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-django=
/0001-Revert-Bumped-minimum-setuptools-version-to-83.patch<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python3=
-django_6.0.7.bb" rel=3D"noreferrer" target=3D"_blank">python3-django_6.0.7=
.bb</a> =3D&gt; <a href=3D"http://python3-django_6.0.8.bb" rel=3D"noreferre=
r" target=3D"_blank">python3-django_6.0.8.bb</a>} (62%)<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-pillow=
/CVE-2026-54058.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-pillow=
/CVE-2026-59204.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-sqlpar=
se/CVE-2026-54284-1.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-sqlpar=
se/CVE-2026-54284-2.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-sqlpar=
se/CVE-2026-59893.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-sqlpar=
se/CVE-2026-59894.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-sqlpar=
se/CVE-2026-71491.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-tornad=
o/CVE-2026-82397.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-tornad=
o/CVE-2026-91990.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-tornad=
o/CVE-2026-91991.patch<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python3=
-tzdata_2026.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-tzdata_2026=
.3.bb</a> =3D&gt; <a href=3D"http://python3-tzdata_2026.4.bb" rel=3D"norefe=
rrer" target=3D"_blank">python3-tzdata_2026.4.bb</a>} (86%)<br>
<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#130763): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/130763" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/130763</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/121716184/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/121716184/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000ea8c66065dab3fe2--

