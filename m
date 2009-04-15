Received: from [83.222.23.61] (helo=relay1.mail.masterhost.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1Lu1gu-0005aJ-5w
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Apr 2009 11:46:03 +0200
Received: from [UNAVAILABLE] ([80.246.246.162] helo=[192.168.1.115])
	by relay1.mail.masterhost.ru with esmtp 
	envelope from <khimov@altell.ru> authenticated with rik@osrc.info
	message id 1Lu1dC-000Bwz-KP
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Apr 2009 13:42:10 +0400
From: Roman I Khimov <khimov@altell.ru>
Organization: Altell Ltd.
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 Apr 2009 13:41:56 +0400
User-Agent: KMail/1.9.9
References: <1239784615-19928-1-git-send-email-khimov@altell.ru>
	<49E5A7C7.6010809@xora.org.uk>
In-Reply-To: <49E5A7C7.6010809@xora.org.uk>
MIME-Version: 1.0
Message-Id: <200904151341.58878.khimov@altell.ru>
X-SA-Exim-Connect-IP: 83.222.23.61
X-SA-Exim-Mail-From: khimov@altell.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=5.0 tests=AWL,BAYES_20,RDNS_NONE,
	SPF_SOFTFAIL autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] libpcap: weaken bluez-libs dependency
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
X-List-Received-Date: Wed, 15 Apr 2009 09:46:03 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wednesday 15 April 2009 13:24:23 Graeme Gregory wrote:
> On 04/15/2009 09:36 AM, Roman I Khimov wrote:
> > +	${@base_contains("COMBINED_FEATURES", "bluetooth", "bluez-libs", "",
>
> NACK, this doesnt do what you think it does as you don't disable
> bluetooth via any form of alteration to the build system. 

It did exactly what I needed from it - kicked bluez-libs out of my build. With 
bluetooth-enabled distros it didn't change anything. Therefore I don't think 
it is true that

> You have created randomness in your build now.

Albeit you must be pointing to the fact that if I had bluez-libs already built 
that might change the behaviour which is true and can be fixed by 
ac_cv_header_bluetooth_bluetooth_h override in 
do_configure_prepend_bluetooth.


