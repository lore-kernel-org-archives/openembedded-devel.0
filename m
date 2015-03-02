Return-Path: <florian.boor@kernelconcepts.de>
X-Greylist: delayed 1331 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 02 Mar 2015 10:56:08 UTC
Received: from mail.kernelconcepts.de (mail.kernelconcepts.de [212.60.202.196])
	by mail.openembedded.org (Postfix) with ESMTP id 7C45F737A9
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Mar 2015 10:56:08 +0000 (UTC)
Received: from [192.168.2.140] by mail.kernelconcepts.de with esmtpsa
	(TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16) (Exim 4.72)
	(envelope-from <florian.boor@kernelconcepts.de>) id 1YSO0v-0005Fl-MY
	for openembedded-devel@lists.openembedded.org;
	Mon, 02 Mar 2015 11:55:53 +0100
Message-ID: <54F441BA.7090602@kernelconcepts.de>
Date: Mon, 02 Mar 2015 11:55:54 +0100
From: Florian Boor <florian.boor@kernelconcepts.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.4.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1425283365-19326-1-git-send-email-Martin.Jansa@gmail.com>	<54F439E6.3010906@dominion.thruhere.net>
	<20150302102611.GY2309@jama>
In-Reply-To: <20150302102611.GY2309@jama>
Subject: Re: [meta-oe][PATCH] vboxguestdrivers: import recipe from meta-luneos
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 02 Mar 2015 10:56:10 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

Hi,

On 02.03.2015 11:26, Martin Jansa wrote:
>> Please don't ever RDEPEND on kernel modules, even when the recipe will 
>> build them, it sets a bad precedent.

> I think it makes sense in this case.. nobody will ever include them in 
> kernel image and vboxguestdrivers utils don't make much sense without the 
> modules installed.

I see its unlikely but in some cases (e.g. highly secure environments) you do
not want to use modules at all. So unless there is a real need to depend on
the modules I would just recommend it.

Greetings

Florian

-- 
The dream of yesterday                  Florian Boor
is the hope of today                    Tel: +49 271-771091-15
and the reality of tomorrow.            Fax: +49 271-771091-19
[Robert Hutchings Goddard, 1904]        florian.boor@kernelconcepts.de
                                        http://www.kernelconcepts.de/en

