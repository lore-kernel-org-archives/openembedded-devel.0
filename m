Received: from mail.atmel.fr ([81.80.104.162] helo=atmel-es2.atmel.fr)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <nicolas.ferre@atmel.com>) id 1Nr77c-0001U4-BJ
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Mar 2010 11:02:09 +0100
Received: from fwat.rfo.atmel.com (gateway [192.168.1.1])
	by atmel-es2.atmel.fr (8.11.7p1+Sun/8.11.6) with SMTP id o2F9oZ809399
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Mar 2010 10:50:35 +0100 (MET)
Received: from meyreuil ([10.159.254.132]) by fwat;
	Mon, 15 Mar 2010 10:34:11 +0100 (MET)
Received: from [127.0.0.1] (pc245_112.atmel.fr [10.159.245.112])
	by meyreuil.atmel.fr (8.11.7p1+Sun/8.11.7) with ESMTP id o2F9q1g07921; 
	Mon, 15 Mar 2010 10:52:02 +0100 (MET)
Message-ID: <4B9E0345.4010904@atmel.com>
Date: Mon, 15 Mar 2010 10:52:05 +0100
From: Nicolas Ferre <nicolas.ferre@atmel.com>
Organization: atmel
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; fr;
	rv:1.9.1.8) Gecko/20100227 Lightning/1.0b1 Thunderbird/3.0.3
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1268640007-6783-1-git-send-email-ulf.samuelsson@atmel.com>
	<4B9DFF67.5030209@atmel.com>
In-Reply-To: <4B9DFF67.5030209@atmel.com>
X-SA-Exim-Connect-IP: 81.80.104.162
X-SA-Exim-Mail-From: nicolas.ferre@atmel.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,SPF_SOFTFAIL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Subject: Re: [PATCH v2 1/1] alsa-state: Support all atmel at91 boards
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
X-List-Received-Date: Mon, 15 Mar 2010 10:02:09 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Le 15/03/2010 10:35, Ulf Samuelsson :
> I will resubmit the alsa-state patch using
> 
> SOC_CLASS="at91"  in conf/machine/at91*
> 
> and
> 
> SRC_URI_at91 = "\
> 	file://at91/asound.conf \
> 	file://at91/asound.state \
> 	file://alsa-state \
> 	"
> 
> in alsa-state.bb

Ulf,
I do not understand: all at91 machines do *not* have the same alsa
states *at all* !! So why create a common asound.state file?
I understand for asound.conf but not for the other file.

Best regards,
-- 
Nicolas Ferre



