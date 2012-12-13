Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Tj9JH-00005g-EL
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Dec 2012 14:58:49 +0100
Received: from mail-ia0-f197.google.com ([209.85.210.197])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 13 Dec 2012 05:44:09 -0800
Received: by mail-ia0-f197.google.com with SMTP id x26so4623062iak.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Dec 2012 05:44:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=z1Xhnx0o13PstADr+PJLX0gMqFMXaUwujQ40l0rbE40=;
	b=dIOA6QQg6ozw6n3FUIj8dq9hpLm5V5n6M8MvxqOXjYdFO6eux0tLuSANPIhNGBe1pm
	OmUFzo15/MZJjPwBQ8pV+uDayz+TqaaR9lOEp0j3kcnTI7Fc52q/uOHzIWCJYTPXc5xf
	PkajT+mL9ERZjkFy+TjtdxbStqfpDacCp7KEwRdtEdiRBXjqeYfBXU3EenF6WWPz1HaS
	/RWH41cH4mWQyiaY3E1+BWCxlShlE9Vk/AWfsRgTx+2LWvAtsKuekZrrHLJSyXZs1hWm
	JGdkXMt5jPWKhzLJ/9NsDZwh4rk8sMFFfdCJjB6JE7dLD9Sj50mhQyyd0Sfb9zbk19la
	Jhkg==
Received: by 10.60.31.49 with SMTP id x17mr1547075oeh.33.1355406248118;
	Thu, 13 Dec 2012 05:44:08 -0800 (PST)
Received: by 10.60.31.49 with SMTP id x17mr1547071oeh.33.1355406247992; Thu,
	13 Dec 2012 05:44:07 -0800 (PST)
MIME-Version: 1.0
Received: by 10.76.132.198 with HTTP; Thu, 13 Dec 2012 05:43:47 -0800 (PST)
In-Reply-To: <CAOd_LFwmq3uoDBn=i9pPvcoJKHspOsnmENKazWp9cNJ5cOm9rA@mail.gmail.com>
References: <CAOd_LFwmq3uoDBn=i9pPvcoJKHspOsnmENKazWp9cNJ5cOm9rA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 13 Dec 2012 13:43:47 +0000
Message-ID: <CAJTo0LbRh1p4Q+Eq=O9xkg-0b9XymEP8m+Da3FDBQGLvqf_h7w@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQkt4FNZgBmsNLVSIRGlUNofFPLIU42wq+Xtic8Twk+lWYcr7aR0+kYvb+p2vw1FPwP80G2yFo2eGnt62qW5xPDWr+mmo3v14wu/E8o93FZ+lS+EqQf4U9ZP91WkpbIxFRDzDo7lO8+Tzlf29tMwb9QtbpI/yvolOSq2OA/tH5tbwRo6k6500NJ+i0lD4wMb82ZUcdkS
Subject: Re: current bbappend issues
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
X-List-Received-Date: Thu, 13 Dec 2012 13:58:50 -0000
Content-Type: text/plain; charset=UTF-8

On 13 December 2012 13:17, Cliff Brake <cliff.brake@gmail.com> wrote:
> ERROR: No recipes available for:
>   /scratch/oe/oe-build-core-3/sources/meta-openembedded/meta-oe/recipes-qt/qt4/qt4-embedded_4.8.3.bbappend
>   /scratch/oe/oe-build-core-3/sources/meta-openembedded/meta-systemd/oe-core/recipes-extended/lighttpd/lighttpd_1.4.31.bbappend
>   /scratch/oe/oe-build-core-3/sources/meta-ti/recipes-graphics/mesa/mesa-dri_8.0.4.bbappend
>   /scratch/oe/oe-build-core-3/sources/meta-openembedded/meta-oe/recipes-qt/qt4/qt4-x11-free_4.8.3.bbappend
> ERROR: Command execution failed: Exited with 1

You can fix that locally by reverting the revert of the qt4 fixes...
(cherry-pick 421a73c9c3bea13e029cd0505711ef02753949bb).

Agreed - meta-oe master needs more maintainers so that it keeps
current with oe-core master.

Ross


