Received: from [64.233.166.176] (helo=py-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <pmiscml@gmail.com>) id 1HlkUG-00026s-QX
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 May 2007 13:37:40 +0200
Received: by py-out-1112.google.com with SMTP id n39so117497pyh
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 May 2007 04:37:07 -0700 (PDT)
Received: by 10.65.141.18 with SMTP id t18mr874199qbn.1178710626945;
	Wed, 09 May 2007 04:37:06 -0700 (PDT)
Received: from cube ( [77.122.190.213])
	by mx.google.com with ESMTP id 38sm7899411nzf.2007.05.09.04.37.05;
	Wed, 09 May 2007 04:37:05 -0700 (PDT)
Date: Wed, 9 May 2007 14:37:09 +0300
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Priority: 3 (Normal)
Message-ID: <818235002.20070509143709@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4641AFCB.6080203@dominion.kabel.utwente.nl>
References: <464130FC.7030008@gmail.com> <02827798.20070509123821@gmail.com>
	<4641A311.4030907@klever.net>
	<4641A5A2.8050108@dominion.kabel.utwente.nl>
	<4641A902.6020506@gmail.com>
	<4641AFCB.6080203@dominion.kabel.utwente.nl>
MIME-Version: 1.0
Subject: Re: QA for intentionally unpackaged files
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 09 May 2007 11:37:41 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Koen,

Wednesday, May 9, 2007, 2:26:03 PM, you wrote:


> Junqian Gordon Xu schreef:
>> Koen Kooi wrote:
>>> Or we could patch package.bbclass[1] to do:
>>>
>>> PACKAGES += "${PN}-leftovers"
>>> FILES_${PN}-leftovers = "/"
>>>
>>> I'm not sure if that works, but if it does, we would be able to spot leftovers more easily
>>> by looking at deploy.
>> 
>> Again, how do you know which one is "intentionally" left-over vs. which 
>> one is not?

> I can't think of a valid reason for not packaging files.

        busybox doesn't package symlinks, as update-alternative
recreates them on install.


        But I agree that catch-all package is better idea than another
adhoc var. Except that we probably should add ${PN}-unshipped and
${PN}-leftovers to distinguish those intentional vs missed cases.

> regards,

> Koen

-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



