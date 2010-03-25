Received: from mail-bw0-f220.google.com ([209.85.218.220])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <douglas.royds@taitradio.com>) id 1Nuujd-00043S-6r
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Mar 2010 22:37:01 +0100
Received: by bwz20 with SMTP id 20so7219974bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Mar 2010 14:33:50 -0700 (PDT)
Received: by 10.204.80.99 with SMTP id s35mr2421153bkk.183.1269552830225;
	Thu, 25 Mar 2010 14:33:50 -0700 (PDT)
Received: from [172.25.116.17] ([202.37.96.126])
	by mx.google.com with ESMTPS id s17sm1177889bkd.4.2010.03.25.14.33.47
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 25 Mar 2010 14:33:49 -0700 (PDT)
Message-ID: <4BABD6B8.8020208@taitradio.com>
Date: Fri, 26 Mar 2010 10:33:44 +1300
From: Douglas Royds <douglas.royds@taitradio.com>
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4BA8A2FA.4040107@koansoftware.com>
In-Reply-To: <4BA8A2FA.4040107@koansoftware.com>
X-SA-Exim-Connect-IP: 209.85.218.220
X-SA-Exim-Mail-From: douglas.royds@taitradio.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: COMPATIBLE_MACHINE - how can use?
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
X-List-Received-Date: Thu, 25 Mar 2010 21:37:02 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

COMPATIBLE_MACHINE uses Python's re.match(), so COMPATIBLE_MACHINE is a
regular expression that must match the start of the MACHINE variable.
For instance, from recipes/linux/linux-davinci_2.6.30.bb:

    COMPATIBLE_MACHINE =
    "(dm6446-evm|dm6467-evm|dm355-evm|davinci-sffsdr|dm355-leopard)"

The following line would have much the same effect:

    COMPATIBLE_MACHINE = "(dm6446|dm6467|dm355|davinci)"

If you try to build this recipe for any non-matching MACHINE, it will
refuse. Additionally, if MACHINE="dm6446-evm" and you ask for a build of
the kernel, only three recipes are compatible:

    * linux-davinci_2.6.28.bb
    * linux-davinci_2.6.30.bb
    * linux-davinci_git.bb

The one that actually gets built will be chosen either alphanumerically,
or by respecting the DEFAULT_PREFERENCE or PREFERRED_VERSION variables.

Hope this helps,
Douglas.


Leo wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Hi at all,
> It's not long ago that I use OE and some things do not know very well.. :D
> For example, can someone explain me how (and where) can use
> COMPATIBLE_MACHINE?
>
>         thanks a lot for all response! :D
>                     hachreak




