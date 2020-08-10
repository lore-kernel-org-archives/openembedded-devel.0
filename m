Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web11.51383.1597084358495523274
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Aug 2020 11:32:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=eDWL2XkE;
 spf=pass (domain: gmail.com, ip: 209.85.222.180, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f180.google.com with SMTP id d14so9270696qke.13
        for <openembedded-devel@lists.openembedded.org>; Mon, 10 Aug 2020 11:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=rCEFUYlXFgoRRxBBpMwDHgbPwgKp8lVYqo2LUfmQs4o=;
        b=eDWL2XkEYFUtiIOwzuxAO9PEJh4ZOLlWFL0F7soE2/pozFoRlBe/gko3CYJxakiu1K
         XvRFa4lU8pX7i0mKdYIXupr6o+2GB9YOb8CgkYyO6KypzLqi5pEHcMcUhHs+bZYiKn2K
         OjwzU2s3ZM/j8VAMPX4g8WLlGnKLpmVp6099NwFxF0uVAu9TJXqeeLBjbDeQU1KVkRuo
         opn+R7yI7VI3REZ67OkrvgqoKR+D9nXBQ/54PupXJE+KiiIESofwh34OFNSgxOE1uwPn
         W15TZQra8V2HsQAGNnKavl7dqZAyDHct1Md0MRMEL1LAzt6XOg7pyPZELM9GY/Y7RX9J
         u5LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=rCEFUYlXFgoRRxBBpMwDHgbPwgKp8lVYqo2LUfmQs4o=;
        b=B/eukXYOiFBfzdWiQWUyk/0OmmM/M3c3nThLa8SSE6hS8TjAYLeZlAaqDJyZ8mF7Hz
         /wYnOHS8lZR8OLHbj4Icu6KVCX90+qDVsrfhpygLUx9y6BM0lG+HXivLJbeDiS6R5422
         TIelTp4q/fjR6XkhRAeoGp2rA/rFjjeeFPorYOUNxP8siHXDSUWYalf6A7GfmrGozYuD
         /AOBxhWmmPE8w5rKX/rENMnzgK8HT8wCSkaOg+41dVX1kK8d6uWaMq+uWcX+2+dy86Ew
         HdOGVBz9xRBD1KODwwOMIpURBDTOW9SLHl6D9wS4vyMaV1cRLj/ns/wHGE/hR9DY7+54
         WDSA==
X-Gm-Message-State: AOAM533XAdvJunz2gWnZkyTYUZxPPq95JJsOZk5eUpLuzwO8+3ONOTMm
	TZRVb9a54jq0dEnfD/tV0vuCAWdJmGs76kHRBzY=
X-Google-Smtp-Source: ABdhPJzQ8NGhvM1Z009Dz8ZD4i8cwiId3q87AOF2GDgSa4uE6rbvbFa3ENtJJ/vU0Ucs8QvDBtlZIUm2DKZJJDVgRo4=
X-Received: by 2002:a37:7081:: with SMTP id l123mr26069872qkc.225.1597084357476;
 Mon, 10 Aug 2020 11:32:37 -0700 (PDT)
MIME-Version: 1.0
References: <16266581D00EA270.9059@lists.openembedded.org> <238a96a5-6068-cd1a-6555-399cd9366656@gmail.com>
In-Reply-To: <238a96a5-6068-cd1a-6555-399cd9366656@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 10 Aug 2020 11:32:11 -0700
Message-ID: <CAMKF1so-9LkHtaY15BTjCE1OF-Z-0V53quM2c3cvUtqDJaaR7w@mail.gmail.com>
Subject: Re: [oe] [dunfell 00/21] Dunfell pull request 4/29
To: akuster <akuster808@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 8, 2020 at 7:42 AM akuster <akuster808@gmail.com> wrote:
>
>
>
> On 7/29/20 7:04 PM, akuster via lists.openembedded.org wrote:
>
> Cover letter only.
>
> Please merge this into dunfell.
>
>
> Any issue for this pull request?

I was off on friday
merged thanks.

>
> -armin
>
> The following changes since commit cc6fc6b1641ab23089c1e3bba11e0c6394f08=
67c:
>
>   ntp: update 4.2.8p15 (2020-07-01 08:01:41 -0700)
>
> are available in the Git repository at:
>
>   git://git.openembedded.org/meta-openembedded dunfell-next
>   http://cgit.openembedded.org/meta-openembedded/log/?h=3Ddunfell-next
>
> Andreas M=C3=BCller (3):
>   blueman: upgrade 2.1.1 -> 2.1.3
>   modemmanager: upgrade 1.12.10 -> 1.12.12
>   ibus: upgrade 1.5.21 -> 1.5.22
>
> Armin Kuster (4):
>   net-snmp: Security fix CVE-2019-20892
>   wireshark: Update to 3.2.5
>   Revert "jsoncpp: upgrade 1.9.2 -> 1.9.3"
>   jsoncpp: add PE do to revert to older PV
>
> Bog999 (1):
>   python3: Add python3-cryptography to RDEPENDS for python3-redis
>
> Changqing Li (1):
>   libmcrypt: set CLEANBROKEN
>
> Khem Raj (1):
>   nss: Remove mcpu to avoid march conflicts
>
> Konrad Weihmann (1):
>   openldap: packaging fixes
>
> Ovidiu Panait (2):
>   freediameter: Fix testcnx ptest failure
>   nss: Fix CVE-2020-12399
>
> Pierre-Jean Texier (1):
>   minicoredumper: update SRC_URI to use github instead
>
> Qi.Chen@windriver.com (1):
>   multipath-tools: disable parallel build as a workaround
>
> Robert Yang (1):
>   drbd-utils: Add CLEANBROKEN to fix rebuild errors
>
> Zang Ruochen (1):
>   nftables: upgrade 0.9.5 -> 0.9.6
>
> Zheng Ruoqin (4):
>   Fix build error when enable multilib.
>   mraa: Disable python2, otherwise, there is a build error when enable
>     multilib.
>   paho-mqtt-c: Fix build error when enable multilib.
>   upm:Fix build error when enable multilib.
>
>  .../tracker/tracker-miners_2.3.3.bb           |   4 +
>  meta-gnome/recipes-support/ibus/ibus.inc      |   4 +-
>  .../{blueman_2.1.1.bb =3D> blueman_2.1.3.bb}    |   3 +-
>  .../{nftables_0.9.5.bb =3D> nftables_0.9.6.bb}  |   2 +-
>  .../0001-Fix-testcnx-expired-CA-data.patch    | 746 ++++++++++++++++++
>  .../freediameter/freediameter_1.3.2.bb        |   1 +
>  .../net-snmp/net-snmp/CVE-2019-20892.patch    | 118 +++
>  .../net-snmp/net-snmp_5.8.bb                  |   1 +
>  .../recipes-support/drbd/drbd-utils_9.12.0.bb |   2 +
>  ...{wireshark_3.2.4.bb =3D> wireshark_3.2.5.bb} |   3 +-
>  ...ger_1.12.10.bb =3D> modemmanager_1.12.12.bb} |   7 +-
>  .../paho-mqtt-c/paho-mqtt-c_1.3.2.bb          |   4 +
>  .../libmcrypt/libmcrypt_2.5.8.bb              |   2 +
>  .../{jsoncpp_1.9.3.bb =3D> jsoncpp_1.9.2.bb}    |   4 +-
>  meta-oe/recipes-extended/mraa/mraa_git.bb     |   2 +-
>  meta-oe/recipes-extended/upm/upm_git.bb       |   4 +
>  .../minicoredumper/minicoredumper_2.0.1.bb    |   2 +-
>  .../multipath-tools/multipath-tools_0.8.4.bb  |   1 +
>  ...e-a-fixed-length-for-DSA-exponentiat.patch | 110 +++
>  meta-oe/recipes-support/nss/nss_3.51.1.bb     |   5 +
>  .../openldap/openldap_2.4.50.bb               |   4 +-
>  .../python/python3-redis_2.10.6.bb            |   1 +
>  22 files changed, 1013 insertions(+), 17 deletions(-)
>  rename meta-networking/recipes-connectivity/blueman/{blueman_2.1.1.bb =
=3D> blueman_2.1.3.bb} (94%)
>  rename meta-networking/recipes-filter/nftables/{nftables_0.9.5.bb =3D> =
nftables_0.9.6.bb} (93%)
>  create mode 100644 meta-networking/recipes-protocols/freediameter/files=
/0001-Fix-testcnx-expired-CA-data.patch
>  create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/=
CVE-2019-20892.patch
>  rename meta-networking/recipes-support/wireshark/{wireshark_3.2.4.bb =
=3D> wireshark_3.2.5.bb} (95%)
>  rename meta-oe/recipes-connectivity/modemmanager/{modemmanager_1.12.10.=
bb =3D> modemmanager_1.12.12.bb} (93%)
>  rename meta-oe/recipes-devtools/jsoncpp/{jsoncpp_1.9.3.bb =3D> jsoncpp_=
1.9.2.bb} (92%)
>  create mode 100644 meta-oe/recipes-support/nss/nss/0001-Bug-1631576-For=
ce-a-fixed-length-for-DSA-exponentiat.patch
>
>
>
>=20
