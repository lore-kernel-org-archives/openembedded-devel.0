Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1Rxkum-0003L8-I5
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Feb 2012 20:53:20 +0100
Received: by qadz30 with SMTP id z30so3889838qad.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Feb 2012 11:45:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=a8NWRahxvF4R6+7LESzKKvONv07BKXZiUlbgJBsK/Wk=;
	b=mR+uXcK2xFrzDAg/q6/GAA1zFZ/Vi8d8w91Um8VZeEpjp8/XHkrm/bNN5OOFNo8diw
	m7l1siAT4DGk4k08v2cHqeSACQsWJrDnDTmIobkR/XRxLpInUan/IL5MnMDlwLfUcocY
	8c3LBZVwR0J4ObGuy15tNiq43igYTjetxZpLM=
MIME-Version: 1.0
Received: by 10.229.136.72 with SMTP id q8mr9640055qct.150.1329335107968; Wed,
	15 Feb 2012 11:45:07 -0800 (PST)
Sender: kergoth@gmail.com
Received: by 10.229.224.145 with HTTP; Wed, 15 Feb 2012 11:45:07 -0800 (PST)
In-Reply-To: <4F3BF21A.30505@freyther.de>
References: <4F3BF21A.30505@freyther.de>
Date: Wed, 15 Feb 2012 12:45:07 -0700
X-Google-Sender-Auth: StwUo1Bsxez1XWr1ET_u5sY1fJk
Message-ID: <CABcZANn19HyAg_dqrnNKf+1bMLhC+DxcsXQ=YqSvvntLq7RaAw@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: checkroot.sh and fsck the root partition
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
X-List-Received-Date: Wed, 15 Feb 2012 19:53:20 -0000
Content-Type: text/plain; charset=UTF-8

On 2/15/12, Holger Freyther <holger+oe@freyther.de> wrote:
> I know most of use ubifs/jffs2 but I have one device with a ext3/ext4
> partition and would like to run fsck as part of the boot (with auto fix up).
> Besides installing the e2fs fsck, fixing the fstab fsck will not be
> executed.
>
> E.g. if I take a look at this script:
> http://git.openembedded.org/openembedded-core/tree/meta/recipes-core/initscripts/initscripts-1.0/checkroot.sh
>
> it is not clear how 'rootcheck' could ever be 'yes'.

My guess, and it is a guess (though potentially comparing against the
original debian initscripts we started with, or looking through git
history, may be informative) is that the original default value of
rootcheck was yes, and hence the conditional in the loop setting
rootcheck=no made sense, but it was changed at some point in the
history due to the use of non-checkable filesystems.

If we change the default back, we'll break everyone using the stock
fstab or one based on it, as the default sets pass=1 for the 'rootfs'
mount. One option would be to source /etc/default/rcS after the
definition of the defaults prior to the loop, thereby allowing a per
machine rcS which changes the default value.
-- 
Christopher Larson


