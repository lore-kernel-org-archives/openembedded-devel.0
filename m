Received: from [74.125.46.154] (helo=yw-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1M8dA8-0004no-Eh
	for openembedded-devel@openembedded.org; Mon, 25 May 2009 18:36:32 +0200
Received: by yw-out-1718.google.com with SMTP id 5so1582713ywm.30
	for <openembedded-devel@openembedded.org>;
	Mon, 25 May 2009 09:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to:cc
	:content-type:content-transfer-encoding;
	bh=oClUsvdfzUcs69yCX4QoFXysL7g+C660Dq7xB7MEWPk=;
	b=s8IAzhqx/oshyz3kdNegog9KVM0XIw13LShgDtlcaQdmnariKm3vwuRwsIVzDCAB4d
	JaRzZPNtUy8AfWzolqT8ltwrCS2LojyXiv0LRB7N4aipRxbVtiK05hdIBTYrzggFNvsR
	D/XUEwWAEVEXyRkXe4no1R1qDoUVbHHz75n4Q=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=ZOhRvBTnP1FHo0tyRhOkBzctW9D5hRu6bJcX2urED8C8aiYVOLZr/+FLjZRl9vT9g7
	cnCxiFmfA/zaTAMbIvoF+X050fGFfA1mZXH/CveusCGlxyY1Ps5SCx9GJyOMjvrEmArm
	NaomFKV1b1SEeHbFUM130nO1Z1yRnA4JwAGhY=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.101.71.3 with SMTP id y3mr12955641ank.62.1243268911528; Mon, 
	25 May 2009 09:28:31 -0700 (PDT)
In-Reply-To: <gvduim$pdi$1@ger.gmane.org>
References: <1243248515-28181-1-git-send-email-ihar.hrachyshka@gmail.com>
	<1243248679-28230-1-git-send-email-ihar.hrachyshka@gmail.com>
	<gvduim$pdi$1@ger.gmane.org>
Date: Mon, 25 May 2009 13:28:31 -0300
X-Google-Sender-Auth: b8938464694289d2
Message-ID: <be7a9f3d0905250928h62ec5d0ev2b7103c5be4abb5a@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Cc: openembedded-devel@openembedded.org
Subject: Re: [PATCH] udev: include udev-utils into udev rootfs
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
X-List-Received-Date: Mon, 25 May 2009 16:36:32 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello,

NACK!

On Mon, May 25, 2009 at 8:14 AM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> On 25-05-09 12:51, Ihar Hrachyshka wrote:
>>
>> The reason for the move is that udevadm binary is executed from udev
>> init.d script.

Wouldn't be better to move udevadm to udev binary?

It makes non-sense to have another package installed by default and
bring more things then required. If it is used by init.d, and this is
ok, so please move the required binary for the udev package and that's
solved.

My 2c.

-- 
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


