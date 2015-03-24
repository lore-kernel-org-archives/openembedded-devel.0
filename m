Return-Path: <ashcharles@gmail.com>
Received: from mail-ie0-f169.google.com (mail-ie0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id C6745734E3;
	Tue, 24 Mar 2015 23:48:46 +0000 (UTC)
Received: by iedm5 with SMTP id m5so10400850ied.3;
	Tue, 24 Mar 2015 16:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=POn9PCNGxwjDjkwSs3EOxtfxSChKQUK/6pA+6OxyM30=;
	b=a8kZMK71BuiKtjX2NAPgEITx9wzJzYZ3k5Ouin/pgQSVlbglOzagl7nRSgiFQ7RMVM
	Brnno7gBpkz27zrczSxgwiZ/NL3G9zpMo+TdduevMOPK3mUCa16HB2oJqAmahjqdeIye
	jRZe9AkLbvxRimJbunvaCgVOC3o4/r3EFcottniASJd3n1Q460k/sVsQhQOkY/g/+Igw
	E3iDsXqjznEcbYYgWEp4dL8foAZ7KaiqQ97YQINEPytc9WzYzvVVTHXxvZMyWuugAdd7
	dl2gFUP54xeNZFSM3ADGPk2CUWwC1ymk0n8H0ebgw8QnbqwLx4AFS86VAbjTSyZ28IL4
	QWZw==
X-Received: by 10.50.122.68 with SMTP id lq4mr25761420igb.10.1427240927404;
	Tue, 24 Mar 2015 16:48:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.138.7 with HTTP; Tue, 24 Mar 2015 16:48:17 -0700 (PDT)
In-Reply-To: <CAMKF1spUz8OsY5b50tCXE==Na=iPicbg-zUZt-NH91gjn6XbdQ@mail.gmail.com>
References: <20150321153245.GK4738@jama>
	<1427126757-16368-1-git-send-email-ashcharles@gmail.com>
	<CAMKF1spUz8OsY5b50tCXE==Na=iPicbg-zUZt-NH91gjn6XbdQ@mail.gmail.com>
From: Ash Charles <ashcharles@gmail.com>
Date: Tue, 24 Mar 2015 16:48:17 -0700
Message-ID: <CAK8F28muE7bFAoBY0FW+0hvz-ctTDLC37RRtpd0KcJGAS4LKaQ@mail.gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>
Cc: "openembedded-commits@lists.openembedded.org"
	<openembedded-commits@lists.openembedded.org>
Subject: Re: [PATCH] mpd: Add build dependency on samba
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 24 Mar 2015 23:48:51 -0000
Content-Type: text/plain; charset=UTF-8

Hi Khem,

Sorry--my commit message was rather unhelpful!  I'll confess I was
just trying to resolve a build warning as I don't have detailed
knowledge of the package.  Digging a little deeper, version 0.19
introduces smbclient which looks to be the source of the dependency of
samba.

Sending a v2 with an updated commit message and packageconfig.  Please
let me know if you see any issues.

--Ash


On Mon, Mar 23, 2015 at 10:10 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Mon, Mar 23, 2015 at 9:05 AM, Ash Charles <ashcharles@gmail.com> wrote:
>> -DEPENDS = "alsa-lib libsamplerate0 libsndfile1 libvorbis libogg faad2 ffmpeg curl sqlite bzip2 pulseaudio tcp-wrappers openal-soft yajl jack faad2 flac libao fluidsynth libcdio wavpack libopus mpg123 libmms libmodplug boost icu dbus expat zlib"
>> +DEPENDS = "alsa-lib libsamplerate0 libsndfile1 libvorbis libogg faad2 ffmpeg curl sqlite bzip2 pulseaudio tcp-wrappers openal-soft yajl jack faad2 flac libao fluidsynth libcdio wavpack libopus mpg123 libmms libmodplug boost icu dbus expat zlib samba"
>
> where is this dependency coming from ? some explanation to this would
> be nice. Can this be avoided ?
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

