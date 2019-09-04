Return-Path: <aehs29@gmail.com>
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
	[209.85.167.65])
	by mail.openembedded.org (Postfix) with ESMTP id E61717D3BC
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Sep 2019 22:44:00 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id d10so342180lfi.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Sep 2019 15:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=e9n7Jrb0pdMMV3fA9JHIXsJR5rjmnmb+MLwaknrPWSU=;
	b=mGQjFGqUf7Usv7l/hiqZRuhX+JUoZpHLVBEzyKZJSgnCSQJf30FJP1iZr79yGzkMvJ
	ol3E5ZDYYCPBwnBn/a2fiylIAuXlQIVb/pnJMW4WyXLGy7kZ+Q+2cxih7cVGvjo+20Sc
	AZkrDmoAmCX/UmQCbhvCxqDkYfqZoYSRmQe+tpm+pamEIC5SypIV5Yl+wyQ3FGxxldrG
	CpaWJ1l0QjFFhmRUDZVArpQFORZKosnYvCCGrX9pLGQQF/ap+9wiosVtuQXZsUkuN/Vh
	EcRMKifqDLub3lgyE3s36Od/fO18Ekf0crF2VIyrrE9TVFtyOezAoza2UgPMjgcFPyh2
	GZ+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=e9n7Jrb0pdMMV3fA9JHIXsJR5rjmnmb+MLwaknrPWSU=;
	b=rXrHkExlHRcXWtCqgXdaf1BfvprODo+Uo2yfTdc9AZBZtWGG2X1kjc50rgYIf6aoNX
	Hv+B+gTJf1uQ1TVvDWvv094HIWVEvvuMtQgJnihGqDrAahrJLqTupu9DP9eEjaKQtiQK
	payMnbvip0VI+XQhng93lHyz3WfyGTRyyK0iQOnJj+ElKJj/Rnw16VDfQDSP3IjhUHRU
	TByoaBXyzYH/3LNoCUw1220/5eOGM4nbKbl5rxWBAy7mVS3YMRZc92vZz4cMh8hoNPmH
	SNTAuq7JmezR6P1kdfiYhH7mID213FM+K9pfhXTTW9roea2EcSIScui5vVGCDQUgzMNp
	e9Gg==
X-Gm-Message-State: APjAAAWYQFEpKEI/rjZY2KrPEMbqzhJew0s6uvlMCNhHorzufusmmtF1
	aKmSOV3bJPXk5GWJLEDqGfiV7hVMKLN+8pETFpM=
X-Google-Smtp-Source: APXvYqwCyElXPT6oou+DPlYw6+HPAb68EAoEldSw9lkTOA6AoC+7s7Kc81op3bqKjw6K8/kKneLVTMfcFNplpQ0bYuA=
X-Received: by 2002:ac2:495e:: with SMTP id o30mr295636lfi.82.1567637041253;
	Wed, 04 Sep 2019 15:44:01 -0700 (PDT)
MIME-Version: 1.0
References: <1567633251-7502-1-git-send-email-aehs29@gmail.com>
	<CAMKF1sp4rXMECorH3XR-Pg3KVxZhOwSqPP7fof5LcQowCR0nqQ@mail.gmail.com>
In-Reply-To: <CAMKF1sp4rXMECorH3XR-Pg3KVxZhOwSqPP7fof5LcQowCR0nqQ@mail.gmail.com>
From: Alejandro Enedino Hernandez Samaniego <aehs29@gmail.com>
Date: Wed, 4 Sep 2019 15:43:49 -0700
Message-ID: <CAHMutrZOgx7KBKc1ONVkzeVSRQa6WhWOX0dQ5r2FwxZ-E1kMeQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] remmina: Add recipe for the remmina remote desktop client
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
X-List-Received-Date: Wed, 04 Sep 2019 22:44:01 -0000
Content-Type: text/plain; charset="UTF-8"

Hey Khem,

On Wed, Sep 4, 2019, 3:21 PM Khem Raj <raj.khem@gmail.com> wrote:

>
>
> On Wed, Sep 4, 2019 at 2:41 PM Alejandro Hernandez <aehs29@gmail.com>
> wrote:
>
>> Remmina has become one of the most widely used RDP clients,
>> it uses freeRDP 2.0 as a backend and also supports multiple
>> network protocols like RSP, VNC, SPICE, NX, and SSH.
>>
>> Signed-off-by: Alejandro Enedino Hernandez Samaniego <aehs29@gmail.com>
>> ---
>>  meta-oe/recipes-support/remmina/remmina_1.3.6.bb | 32
>> ++++++++++++++++++++++++
>>  1 file changed, 32 insertions(+)
>>  create mode 100644 meta-oe/recipes-support/remmina/remmina_1.3.6.bb
>>
>> diff --git a/meta-oe/recipes-support/remmina/remmina_1.3.6.bb
>> b/meta-oe/recipes-support/remmina/remmina_1.3.6.bb
>> new file mode 100644
>> index 0000000..81514fa
>> --- /dev/null
>> +++ b/meta-oe/recipes-support/remmina/remmina_1.3.6.bb
>> @@ -0,0 +1,32 @@
>> +DESCRIPTION = "A feature rich Remote Desktop Application written in GTK+"
>> +HOMEPAGE = "https://remmina.org"
>> +LICENSE = "GPLv2 & openssl"
>> +SECTION = "Support"
>> +
>> +SRC_URI = "
>> https://gitlab.com/Remmina/Remmina/-/archive/v${PV}/Remmina-v${PV}.tar.bz2
>> \
>> +"
>> +
>> +S = "${WORKDIR}/Remmina-v${PV}"
>> +
>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=dab7215512044d49037272ce1ac4ea8f
>> file://LICENSE.OpenSSL;md5=c1eb3cee0a4dea27503c531267a69769"
>> +
>> +
>> +SRC_URI[md5sum] = "6da599c3a5cab2df37a70f8fba2f5438"
>> +SRC_URI[sha256sum] =
>> "fbed745438bb0c21467b60cbd67c8148a9289b5ebc7482d06db443bea556af1a"
>> +
>> +inherit cmake
>> +
>> +EXTRA_OECMAKE += "-DWITH_APPINDICATOR=OFF -DWITH_GETTEXT=OFF
>> -DWITH_TRANSLATIONS=OFF"
>> +
>> +do_install_append(){
>> +    # We dont need the extra stuff form other desktop environments
>> +    rm -rf ${D}/${datadir}/xsessions
>> +    rm -rf ${D}/${datadir}/metainfo
>> +    rm -rf ${D}/${datadir}/gnome-session
>> +}
>> +
>> +RDEPENDS_${PN} = "bash"
>> +
>> +FILES_${PN}_append = " ${datadir}/icons/hicolor/*"
>> +
>> +DEPENDS += "openssl freerdp gtk+3 gdk-pixbuf atk libgcrypt avahi-ui
>> libsodium libssh vte json-glib libsoup-2.4 libvncserver spice
>> spice-protocol libsecret"
>>
>
> I think the depends section should be above at least rdep section maybe
> better run the Oe-stylize script on it and adjust for format while you are
> here
>

Sure thing, will do that and send a v2.

Thanks

Alejandro

> --
>> 2.7.4
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>

