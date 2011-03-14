Received: from na3sys009aog101.obsmtp.com ([74.125.149.67])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bengardiner@nanometrics.ca>) id 1PzB4f-0006rl-Fz
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Mar 2011 17:56:53 +0100
Received: from source ([209.85.220.174]) (using TLSv1) by
	na3sys009aob101.postini.com ([74.125.148.12]) with SMTP
	ID DSNKTX5IcWILIc/XJ5zr1q5qgBenkqnkbQee@postini.com;
	Mon, 14 Mar 2011 09:55:14 PDT
Received: by mail-vx0-f174.google.com with SMTP id 39so5369521vxi.33
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Mar 2011 09:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nanometrics.ca; s=google;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=U8h/y6TqwWi5av9u02GXW+rcpmWuxJRqTHSGxDH5uTA=;
	b=qNhPKK1dXx5QEDL3puqIRnZxMrPBjJUOxkufz2km4lQFh0UNbbjFaK1EzPfVhN2d+o
	/+kOpTYu2MeZZU8LJyf8wBoRumxdEggWoYoZRudddGhObJUMgMlkPaW69ige7mu86Q+y
	oHqEtPrpa0bS9mA7LAQvI3fFpOFFhmVDjnbtU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=nanometrics.ca; s=google;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=FTQ7lN7/pT2WPIeFghh0yq79boUIBIsln6HCnU0S6EVEV0dVquimZNVmeCKtFC14WF
	xO8EAut9vIOPtjdihGBNg/QArpCvRExRlXXxwtomB1f0dgx/2ftb0DbU9TD8tMR7TfhJ
	f2/EZ2CXFLj1KF+za9jdX8YpF69ZZKCiCtUuk=
MIME-Version: 1.0
Received: by 10.52.71.243 with SMTP id y19mr2758427vdu.191.1300119983755; Mon,
	14 Mar 2011 09:26:23 -0700 (PDT)
Received: by 10.52.168.225 with HTTP; Mon, 14 Mar 2011 09:26:23 -0700 (PDT)
In-Reply-To: <4D7E3BB2.6060104@mentor.com>
References: <1300111886-4102-1-git-send-email-bengardiner@nanometrics.ca>
	<4D7E3BB2.6060104@mentor.com>
Date: Mon, 14 Mar 2011 12:26:23 -0400
Message-ID: <AANLkTiknm8aEyOyS5jt237F6-PZrjCm9wJZKvWFYii6s@mail.gmail.com>
From: Ben Gardiner <bengardiner@nanometrics.ca>
To: Tom Rini <tom_rini@mentor.com>
Cc: arago-devel@gforge.ti.com, Tom Rini <trini@embeddedalley.com>,
	Koen Kooi <koen@openembedded.org>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] bitbake.conf : make IMAGE_CMD_ubifs also produce .rootfs.ubifs
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
X-List-Received-Date: Mon, 14 Mar 2011 16:56:53 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Tom,

Thanks for the rapid reply.

On Mon, Mar 14, 2011 at 12:00 PM, Tom Rini <tom_rini@mentor.com> wrote:
>
> On 03/14/2011 07:11 AM, Ben Gardiner wrote:
>>
>> The ubifs image filenames produced by the ubi and ubifs commands differ.
>>
>> IMAGE_CMD_ubi produces an interim ubifs image
>> ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubifs ; whereas IMAGE_CMD_ubifs
>> produces a final ubifs image
>> ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.ubifs.img
>>
>> This results in the undesirable behaviour then when a user specifies
>> IMAGE_FSTYPES contains ubifs (as opposed to ubi) they get a broken link
>> ${DEPLOY_DIR_IMAGE}/${ROOTFS_IMAGE}-${MACHINE}.ubifs pointing to the
>> non-existant ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubifs
>>
>> Fix the discrepancy by making the IMAGE_CMD_ubifs also produce the
>> .rootfs.ubifs target like the IMAGE_CMD_ubi does and preserve the old
>> .ubifs.img filename as a link for backwards compatibility.
>
> So, wait. =A0What's the problem here? =A0If you do IMAGE_FSTYPES=3D"ubifs=
" you get the interim image which isn't useful normally but is
> useful if you're doing volume management outside of the provided build ta=
rgets. It's not however a valid rootfs target since it can't be
> used as is. =A0I think what's missing here is just a comment to the effec=
t that most people do not want 'ubifs' and they do want 'ubi' as
> we provide ubifs for advanced usages.

The other way around: If I do IMAGE_FSTYPES=3D"ubifs" then I don't get
the interim .rootfs.ubifs image I get instead a .ubifs.img; the
.ubifs.img extension is different than the extensions produced by the
other IMAGE_CMD's.

I agree that  they are all valid rootfs images -- what is a difficulty
for me is the resulting filename. The symlink 'sugar' provided by
bitbake in ${DEPLOY_DIR_IMAGE} points to broken images: it always
expects the .rootfs.<type> extension.

All other IMAGE_CMD's produce .rootfs.<type>, excecpt for
IMAGE_CMD_UBIFS, which produces .ubifs.img

>>
>> Signed-off-by: Ben Gardiner<bengardiner@nanometrics.ca>
>> CC: Tom Rini<trini@embeddedalley.com>
>> CC: Koen Kooi<koen@openembedded.org>
>> CC: Denys Dmytriyenko<denis@denix.org>
>>
>> ---
>>
>> Please also consider this patch for inclusion into the 2011.03-maintenan=
ce
>> branch and into arago-oe-dev
>
> Just as a general comment, I don't want combined requests for 2011.03-mai=
ntenance but do feel free to make the request as soon
> as it hits a mainline tree (and you've done the relevant testing on 2011.=
03-maintenance).

My apologies -- it won't happen again.

>> The reason I want to be able to address the ubifs image -- and
>> not the UBI image -- is because I am trying to produce a UBI image from =
a
>> a different ubinize config file which will contain both rootfs and
>> kernel volumes.
>>
>> I am trying to accomplish this by creating a recipe which depends on the
>> rootfs and kernel images we use. This recipe needs to synthesize the ima=
ge
>> file path, but without this patch it isn't simple since the link
>> ${DEPLOY_DIR_IMAGE}/${ROOTFS_IMAGE}-${MACHINE}.ubifs is broken.
>
> So, this is a valid use case (which I was spelling out above, before I go=
t down here). but I think you're using the wrong variables. >=A0There shoul=
d be something that maps over to ${IMAGE_NAME}.ubifs.img

You nailed the use case. :)

There are additional complications (to me) introduced by the fact that
the full image filename produced by bitbake has the 'ipk' stuff in it
as well so it isn't as simple as synthesizing with .ubifs.img on the
end.

If you are still opposed to the proposed change; i.e. normalizing
IMAGE_CMD_ubifs so that it produces .rootfs.ubifs instead of
.ubifs.img. Could I request your help to suggest how I would
synthesize the following image name:
arago-base-image-glibc-ipk-2010.03-da850-omapl138-evm.ubifs.img

Best Regards,
Ben Gardiner

---
Nanometrics Inc.
http://www.nanometrics.ca


