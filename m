Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jay@jay-tech.ru>) id 1ORhub-0000Kw-KU
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Jun 2010 10:35:54 +0200
Received: by fxm1 with SMTP id 1so1796946fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Jun 2010 01:31:16 -0700 (PDT)
Received: by 10.87.47.6 with SMTP id z6mr14931162fgj.13.1277368276220;
	Thu, 24 Jun 2010 01:31:16 -0700 (PDT)
Received: from is.home (95-29-191-198.broadband.corbina.ru [95.29.191.198])
	by mx.google.com with ESMTPS id l19sm15517147fgb.5.2010.06.24.01.31.14
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 24 Jun 2010 01:31:14 -0700 (PDT)
Sender: Yuri Bushmelev <jay@jay-tech.ru>
From: Yuri Bushmelev <jay4mail@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 Jun 2010 12:30:18 +0400
User-Agent: KMail/1.13.3 (Linux/2.6.32-un-def-alt15; KDE/4.4.4; i686; ; )
References: <AANLkTilEWkJxX-05BU-UBnOIP9jgP3vtf8K7jA5-A9Q6@mail.gmail.com>
In-Reply-To: <AANLkTilEWkJxX-05BU-UBnOIP9jgP3vtf8K7jA5-A9Q6@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201006241230.18165.jay4mail@gmail.com>
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: jay@jay-tech.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=AWL,BAYES_00,SPF_SOFTFAIL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: makedevs vs. device_table-minimal.txt
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
X-List-Received-Date: Thu, 24 Jun 2010 08:35:54 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

Hello!

> after commit 66aa4ed9410ba1d652e40571f48a985337e56a26
> (device_table-minimal.txt: fix input device nodes path. Input event
> device nodes are usually under /dev/input.) in /dev of my rootfs I
> don't have any event device node.
> 
> Any obvious reason why makedevs would fail to create /dev/input/eventX ?

Please note that this is linux-kexecboot initramfs, not common image rootfs.
We have no device manager (udev/mdev) there.
And (as I understand image.bbclass) there is no possibility to create 
directory in rootfs from recipe before makedevs call.

-- 
Yuri Bushmelev


