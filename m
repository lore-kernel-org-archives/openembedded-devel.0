Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vc0-f181.google.com (mail-vc0-f181.google.com
	[209.85.220.181])
	by mail.openembedded.org (Postfix) with ESMTP id 1686C71658
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Oct 2014 08:35:20 +0000 (UTC)
Received: by mail-vc0-f181.google.com with SMTP id le20so218122vcb.40
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Oct 2014 01:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=SKbbcMDlrdSuNIXnUVQ908TaBJrLIoVVNo38/6F9AO8=;
	b=W9PdrmrsavKvJNcRoYaxVgw5E1nrJQO0XeU9KnF7hzaJYVttz1rKC416zlcSXGyp1j
	UHLfDJppkz2XbJyEhoHdJTrMNNR9c5VMkRj0sM9TOttIEzuMaCw+Mps9PS8Ih7cqbf1L
	SF03P2O60y9N7n7T6ViBQPsQa1x44I/zY9v2mVzW29/S1MID4aeaWimy1DqAFw3A53Av
	PL8MOUSp45fVrwFIzeWqPp5lv20TyCY9kJIHsG3OvSrfTpRd+PKZEugWl4fVYmdILH5+
	JNXAV/5OG1aLEPhaaWtqBeV56BnKHPwf5Dh9rgi03CJC3M9VuM1SjWrmhpWxif8jMxXI
	TnoQ==
MIME-Version: 1.0
X-Received: by 10.52.109.167 with SMTP id ht7mr1671815vdb.33.1412152521999;
	Wed, 01 Oct 2014 01:35:21 -0700 (PDT)
Received: by 10.52.171.233 with HTTP; Wed, 1 Oct 2014 01:35:21 -0700 (PDT)
In-Reply-To: <CAMP9K8-g9Cd6SiNOidENMtvZ8beeWWAvv0GHA=7j-N_LUk_XJg@mail.gmail.com>
References: <CAMP9K8-g9Cd6SiNOidENMtvZ8beeWWAvv0GHA=7j-N_LUk_XJg@mail.gmail.com>
Date: Wed, 1 Oct 2014 10:35:21 +0200
Message-ID: <CALbNGRSo4uZStuLv3bX1LV958-R2i7Q_BHda44pRikxxF5Cc=w@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: meta-xfce: how to change the default background?
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
X-List-Received-Date: Wed, 01 Oct 2014 08:35:30 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Sep 30, 2014 at 11:26 PM, California Sullivan
<californialsullivan@gmail.com> wrote:
> Hi all,
>
> When building an image and using the xfce package, I would like to be able
> to set a custom default background (i.e., before the image is ever booted
> up).
>
> I have been unable to find any documentation on how to do this, and I
> haven't found any clues by poking around in the layer.
>
> Any pointers from somebody with experience in this area, or any links to
> documentation on how this could be done would be very much appreciated.
>
> Thank you,
> Cal Sullivan
Hi Cal,

This setting is found in
<userhome>/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-desktop.xml
entry 'image-path'.

If you want you can look into my meta-misc [1]:

* a default config installing into /etc/skel
* operator-user getting the settings from /etc/skel on creation

note that this solution does not work for upgrades. For this you need
some magic in pkg_postinst copying changes from /etc/skel to user's
home.

Hope it helps...

Andreas

[1] https://gitorious.org/schnitzeltony-oe-meta/meta-misc/source/024201b0b256338df4460c39447e9660e16872a0:recipes-setup

