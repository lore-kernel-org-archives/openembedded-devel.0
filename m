Received: from [64.233.166.178] (helo=py-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <pmiscml@gmail.com>) id 1HO9ZB-0005i4-9e
	for openembedded-devel@lists.openembedded.org;
	Mon, 05 Mar 2007 10:33:13 +0100
Received: by py-out-1112.google.com with SMTP id n39so781997pyh
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Mar 2007 01:33:10 -0800 (PST)
Received: by 10.35.17.12 with SMTP id u12mr13913757pyi.1173087190432;
	Mon, 05 Mar 2007 01:33:10 -0800 (PST)
Received: from cube ( [82.193.98.6])
	by mx.google.com with ESMTP id 36sm8528779nza.2007.03.05.01.33.08;
	Mon, 05 Mar 2007 01:33:09 -0800 (PST)
Date: Mon, 5 Mar 2007 11:33:08 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Priority: 3 (Normal)
Message-ID: <374228801.20070305113308@gmail.com>
To: Koen Kooi <openembedded-devel@lists.openembedded.org>
In-Reply-To: <45EBBF38.4020704@dominion.kabel.utwente.nl>
References: <407130732.20070227223500@gmail.com>
	<1172609341.28406.169.camel@localhost.localdomain>
	<1828813817.20070227233137@gmail.com>
	<1172613830.28406.192.camel@localhost.localdomain>
	<794972911.20070305013040@gmail.com>
	<1173051658.5832.26.camel@localhost.localdomain>
	<45EBBF38.4020704@dominion.kabel.utwente.nl>
MIME-Version: 1.0
Subject: Re: [RFC] base_less_or_equal() for numerical value testing in OE
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
X-List-Received-Date: Mon, 05 Mar 2007 09:33:13 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Koen,

Monday, March 5, 2007, 8:56:56 AM, you wrote:

[]

>> You only ask for screen size but I can guarantee that wouldn't be the
>> last request. I'm dead set against this.

> Me too, since you will get something like this:

> application_1.4.5-r5_bigscreen.ipk
> application_1.4.5-r5_ppc603e.ipk
> application_1.4.5-r5_armv5te.ipk
> application_1.4.5-r5_smallscreen.ipk

> Now Marcin wants to install 'application' on his webpad and it doesn't run. Why? Because
> 'application_1.4.5-r5_bigscreen.ipk' secretly is ARM instead of x86.

  This was covered in my original rundown of how that could be
implemented. I proposed to have convention that smallscreen/datascreen
virtual archs may be applied only to data packages (whose arch would
be 'all' otherwise). Obviously, this can be enforced by insane.class.

  So, it would be:

application_1.4.5-r5_ppc603e.ipk
application_1.4.5-r5_armv5te.ipk
+
application-data_1.4.5-r5_bigscreen.ipk
application-data_1.4.5-r5_smallscreen.ipk

> regards,

> Koen

[]

-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



