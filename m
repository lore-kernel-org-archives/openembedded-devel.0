Received: from [209.85.134.191] (helo=mu-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1J4Dtm-0002i0-Dq
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Dec 2007 12:12:38 +0100
Received: by mu-out-0910.google.com with SMTP id w8so3062679mue.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Dec 2007 03:07:50 -0800 (PST)
Received: by 10.86.72.15 with SMTP id u15mr6316100fga.11.1197889669764;
	Mon, 17 Dec 2007 03:07:49 -0800 (PST)
Received: from ?192.168.20.166? ( [194.79.8.34])
	by mx.google.com with ESMTPS id g28sm17336142fkg.2007.12.17.03.07.48
	(version=SSLv3 cipher=OTHER); Mon, 17 Dec 2007 03:07:49 -0800 (PST)
Date: Mon, 17 Dec 2007 13:13:08 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Mailer: The Bat! (v3.64.01 Christmas Edition) Professional
X-Priority: 3 (Normal)
Message-ID: <1674566773.20071217131308@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4762E496.1040806@student.utwente.nl>
References: <4762095D.4060505@protium.com>
	<4762E496.1040806@student.utwente.nl>
MIME-Version: 1.0
Subject: Re: RFC: Renaming uboot-utils
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
X-List-Received-Date: Mon, 17 Dec 2007 11:12:38 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Koen,

Friday, December 14, 2007, 10:16:22 PM, you wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1

> Andy Wilcox schreef:
>> Since uboot-utils builds a native binary (mkImage) it should really be 
>> called
>> uboot-utils-native.

> That part makes sense. FWIW, we already have a uboot-mkimage-native
> recipe in OE.

>> My motivation is (a) I'd really like to build a few tools from uboot
>> which are cross-compiled

> And now you're talking about uboot-utils-cross, not uboot-utils-native

  I had a look at mkimage source, it appears to generate
target-independent format (does htonl() and friends), so it at least
can stay uboot-utils-native as the actual commit made it.

  More interestingly is that both u-boot and u-boot-utils-native stage
mkimage, and that's all what u-boot-utils-native does actually, so we
have redundancy here.

> regards,

> Koen

[]


-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



