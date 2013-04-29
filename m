Received: from mail-vc0-f178.google.com ([209.85.220.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UWiry-000892-Ke
	for openembedded-devel@lists.openembedded.org;
	Mon, 29 Apr 2013 09:51:35 +0200
Received: by mail-vc0-f178.google.com with SMTP id ha11so1595115vcb.9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Apr 2013 00:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:content-type:content-transfer-encoding;
	bh=1KxPtcSPCmGE7hPN8IvyeMTdzXKD7uf4wfvcTw33PuI=;
	b=dJKn9EbyTSPkoju5OwmtCQ28dAztvWKujqWp72kRghBfGZUPbgZl1TUDqQGOiCRIVA
	9kXljs0RmEo8lOsmp3pF05x2VyB+I54SpfkjPPuGBSypLIKJxL7mrgxWRWQkv/TjxVSB
	Pxvom1FZU9nDJjGJL5dQeyjV6fIEve2naNwk+YoKFyW0tzO4xHvdka45Ng8KpireibYA
	UHyJGOJfLfb4VYUxJEjbMZae1VEAGqqIyBXGBcgTlcT4ty1l8DDATGVcl3/V4yFbkYBc
	zzgcyO6Hacbj1Mac5ww1P7bhdDRbfDWbax6jm3u0hwgczrnVwUjo59VaXvl+W4rc6HU5
	BFPg==
MIME-Version: 1.0
X-Received: by 10.58.198.79 with SMTP id ja15mr10832121vec.15.1367220821434;
	Mon, 29 Apr 2013 00:33:41 -0700 (PDT)
Received: by 10.52.183.36 with HTTP; Mon, 29 Apr 2013 00:33:41 -0700 (PDT)
In-Reply-To: <20130427193111.GF3199@jama>
References: <1367087640-4264-1-git-send-email-schnitzeltony@googlemail.com>
	<1367087640-4264-2-git-send-email-schnitzeltony@googlemail.com>
	<20130427193111.GF3199@jama>
Date: Mon, 29 Apr 2013 09:33:41 +0200
Message-ID: <CALbNGRSZ-H-+0yZuf4uvYbLEqXdUzTuMLXMhc63BtrZPieYyLA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-gnome/meta-xfce 1/4] gdm: fix postinst-code to unbreak first boot issues
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
X-List-Received-Date: Mon, 29 Apr 2013 07:51:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 27, 2013 at 9:31 PM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> On Sat, Apr 27, 2013 at 08:33:57PM +0200, Andreas M=C3=BCller wrote:
>> Exiting postinst code leaves systemd.bbclass offline postinst code unexe=
cuted,
>> causes postinst not to finish at first boot (gdm.service is not aliased =
to
>> display-manager.service -> started much too early) and is not neccesary:
>> language preparation can be done offline.
>>
>> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
>> ---
>>  meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb |   31 ++++++++++-----------=
------
>>  1 files changed, 12 insertions(+), 19 deletions(-)
>>
>>
>> +pkg_postinst_${PN} () {
>>  # Register up as default dm
>> -mkdir -p ${sysconfdir}/X11/
>> -echo "${bindir}/gdm" > ${sysconfdir}/X11/default-display-manager
>> -
>> +mkdir -p $D${sysconfdir}/X11/
>> +echo "${bindir}/gdm" > $D${sysconfdir}/X11/default-display-manager
>
> Maybe we should use u-a for default-display-manager like we use x-window-=
manager for WMs.
>
> but git grep display-manager shows only
> meta-oe/recipes-graphics/nonworking/slim/slim_1.3.2.bb
> doing the same as gdm
>
Intention of this patch is fixing postinst failure. I have no idea
what this file is for. Can somebody give me a hint (is it required in
systemd environments?) and can we fix this in another series?
By the way: I am not using gdm. From what I have seen during tests for
this series it needs a lot more love to work as expected:
* gdm decides to put my standard user into the list of excluded users
so it is not displayed in the list and has to be entered manually.
* it is terribly slow
* the log files are full of different warnings - one thing I saw was
that polkit-gnome does not find its way into the image although it is
recommended

Andreas


