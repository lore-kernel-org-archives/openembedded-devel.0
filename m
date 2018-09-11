Return-Path: <mhm.dawod@gmail.com>
Received: from mail-qt0-f169.google.com (mail-qt0-f169.google.com
	[209.85.216.169])
	by mail.openembedded.org (Postfix) with ESMTP id 0477C74A12;
	Tue, 11 Sep 2018 09:03:03 +0000 (UTC)
Received: by mail-qt0-f169.google.com with SMTP id h4-v6so27394665qtj.7;
	Tue, 11 Sep 2018 02:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=6Lmkd5DhKv0c70ua/c57owQ3UpsJo6ke0QAXFj5odQI=;
	b=O97cCcGeuL89edgbIadEzvk1o2yEb44HvjiJNuWxcXxRtlPBb3svUQjydMIliJQErd
	KewGK7eZouWwBURmRB4GhuFR7kjgICv27dIXdsQ6Q/1O5v9j74d96QOlhGiPx5kMYj8T
	BoeNDoQS/6EKbACnF6o+gI4YsJoxgLP9A07YLmIDl39OQOXbwB2tB8DW9nrfeHP8TFXx
	Ms3NTlVmzf2GuCvQcmDWvDvVyYMgJDos/hNUGRMS6wevT69zHaYoa7n2xY22n+6fEyik
	gpasyIiDym7am1DKK8l8ZlJHb2ZYWdcKSoerrnFIH7tOigAZh1MV00n3a6BJHOnq0JMe
	Svzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=6Lmkd5DhKv0c70ua/c57owQ3UpsJo6ke0QAXFj5odQI=;
	b=OtLc3xG9wr0VsYpcvnuvmoX9MOJN90452PzKSAxTcAJr7QTet9ht8g3XF1ACCIi1mW
	EAIZpLdBiTtAsCwPcQ8lhawhgho2yOZTrLZmj/kdf0p0faSUTGKEMoZTYYF/ach555U4
	a2gdGUu9zvHk03sfMGCdDBAf3aVEFDPNrOR+eywGGMyoDxrIqtyFljxfsRud1or86Bj5
	wseK1thKjPSdktF0oHXprvri9BtETAE8On5EARkHilhZJCayP1S0VNmmyT2EE0I2Nmb0
	MXAOZb2cCSOedZVW+Y+8wiP1Y0q+Ax5e6UvSe5p5eQrkO4yZoD4K2sLXHuI+BTpldapE
	ONTw==
X-Gm-Message-State: APzg51AIB0Qs7c1oJh5D2SxclvVioIX+T9mh0fODpOrYRZzYvY89kS4R
	bpgKqpoq0pFgPDnZlZgIvb9E9XyrR/2vM3UywYJmcQ==
X-Google-Smtp-Source: ANB0VdbrgFbBPdZPxYlXe3/1LQnax7F/tUQ7C0+Olhj+Rd2uKF8UEKEZ21UN2myaRQBJYfZpIkZeBNXyPvbBp9AtUqI=
X-Received: by 2002:ac8:32ea:: with SMTP id
	a39-v6mr19478793qtb.234.1536656584628; 
	Tue, 11 Sep 2018 02:03:04 -0700 (PDT)
MIME-Version: 1.0
References: <CAGCTLNSbsH7Hto3CwpC+p0YFWQqnYRHYm2TwcbH6w5TzbtBP5A@mail.gmail.com>
	<bdc7edec-3e0b-0d97-05d7-8e7847326b96@konsulko.com>
	<CAGCTLNQF14iHMTvog5iTenWQiCvRkyGfJkN=fskfCDo=AE=7eg@mail.gmail.com>
In-Reply-To: <CAGCTLNQF14iHMTvog5iTenWQiCvRkyGfJkN=fskfCDo=AE=7eg@mail.gmail.com>
From: Mohamed Dawod <mhm.dawod@gmail.com>
Date: Tue, 11 Sep 2018 11:02:52 +0200
Message-ID: <CAGCTLNQAv_ktGjwbqKLL_81yHb_uVN2b+CkwXR1eOZc_fBbU6A@mail.gmail.com>
To: openembedded-core@lists.openembedded.org, 
	openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [openembedded][wayland][weston]: How to configure screen resolution
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
X-List-Received-Date: Tue, 11 Sep 2018 09:03:04 -0000
Content-Type: text/plain; charset="UTF-8"

---------- Forwarded message ---------
From: Mohamed Dawod <mhm.dawod@gmail.com>
Date: Mon, Sep 10, 2018 at 1:15 PM
Subject: Re: [oe] [openembedded][wayland][weston]: How to configure screen
resolution
To: <leon.anavi@konsulko.com>



I typed the following weston.ini and weston-init.bbappend file but no thing
change !!!!

--------------------------------------------------------------------------------------------------------------------------------
This is my weston.ini file :
===================
[core]
idle-time=0

[shell]
locking=false

[screensaver]
path=""

[output]
name=HDMI1
transform=0
mode=1920x1080
--------------------------------------------------------------------------------------------------------------------------------
and this is my weston-init.bbappend file :
===============================
DESCRIPTION = "Installation of weston.ini config file"
LICENSE = "CLOSED"

FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
SRC_URI_append = " file://weston.ini"

do_install_append() {
    WESTON_INI_CONFIG=${sysconfdir}/xdg/weston
#    WESTON_INI_CONFIG=/root/.conf
#    WESTON_INI_CONFIG=/.config
#    WESTON_INI_CONFIG=/run/user/root/weston
    install -d ${D}${WESTON_INI_CONFIG}
    install -m 0644 ${WORKDIR}/weston.ini ${D}${WESTON_INI_CONFIG}
}

PACKAGES += "${PN}-ini"
FILES_${PN}-ini = "${sysconfdir}/xdg"
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Thank you for your help,








On Mon, Sep 10, 2018 at 10:30 AM Leon Anavi <leon.anavi@konsulko.com> wrote:

> Hi Mohamed,
>
>
> On 9.09.2018 14:10, Mohamed Dawod wrote:
> > Hello,
> >
> > I want to know how to change the screen resolution using weston.ini file
> ?
>
> You can set the resolution size width and height in pixels with property
> mode in the output section of weston.ini. For example:
>
> [output]
> mode=1680x1050
>
> Please have a look at weston documentation for details.
>
>
> > How to generate this file and use it for my image?
>
> You can update or provide your version of weston.ini through a bbappend
> file.
>
> Best regards,
> Leon
>
> >
> > Thanks,
> >
>
> --
> Leon Anavi
> Software Engineer
> konsulko.com
>
>
>

-- 

Mohamed Dawod
Computer Engineering Department
Faculty of Engineering
Cairo University


-- 

Mohamed Dawod
Computer Engineering Department
Faculty of Engineering
Cairo University

