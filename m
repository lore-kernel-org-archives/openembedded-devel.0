Received: from [64.233.166.180] (helo=py-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <pmiscml@gmail.com>) id 1HZlwT-0002ZN-SY
	for openembedded-devel@lists.openembedded.org;
	Fri, 06 Apr 2007 12:45:20 +0200
Received: by py-out-1112.google.com with SMTP id n39so413597pyh
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Apr 2007 03:45:16 -0700 (PDT)
Received: by 10.65.215.14 with SMTP id s14mr5699284qbq.1175856316190;
	Fri, 06 Apr 2007 03:45:16 -0700 (PDT)
Received: from cube ( [82.193.98.4])
	by mx.google.com with ESMTP id m1sm4572564nzf.2007.04.06.03.45.15;
	Fri, 06 Apr 2007 03:45:15 -0700 (PDT)
Date: Fri, 6 Apr 2007 13:45:22 +0300
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Priority: 3 (Normal)
Message-ID: <408285868.20070406134522@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1168683040.20070405173920@gmail.com>
References: <1168683040.20070405173920@gmail.com>
MIME-Version: 1.0
Subject: Re: [RFC] Cleaning up service handling in OE
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
X-List-Received-Date: Fri, 06 Apr 2007 10:45:25 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello,

Thursday, April 5, 2007, 5:39:20 PM, you wrote:

> Hello openembedded-devel,

>   By service, I mean /etc/init.d/* scripts, which all follow
> start/stop command convention, etc. They also can autostart on boot or
> not. This is actually the topic of this RFC - to call for discussion
> of guidelines the packages should follow in their wish to install
> their services for autostart on boot.

>   A specific case which makes me raise this question is irda-utils
> packages which includes irattach service, which it bothers to install
> for autostart. The result of this is that IrDA is being activated
> unconditionally on boot, eating power, and disallowing other processes
> to control IrDA port on their own. The only reason it doesn't hit many
> users is that service script itself broken and fails to detect IrDA
> port on most of machines.

  Ok, this was fixed.

  Comments for general improvements to service handling are still
welcome!

[]



-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



