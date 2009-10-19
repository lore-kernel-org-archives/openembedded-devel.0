Received: from [64.202.165.22] (helo=smtpauth16.prod.mesa1.secureserver.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <mike@mwester.net>) id 1Mzwfn-00067P-GI
	for openembedded-devel@openembedded.org; Mon, 19 Oct 2009 20:09:39 +0200
Received: (qmail 30375 invoked from network); 19 Oct 2009 18:08:34 -0000
Received: from unknown (75.60.2.127)
	by smtpauth16.prod.mesa1.secureserver.net (64.202.165.22) with ESMTP;
	19 Oct 2009 18:08:34 -0000
Message-ID: <4ADCAB0E.9050607@mwester.net>
Date: Mon, 19 Oct 2009 13:08:14 -0500
From: Mike Westerhof <mike@mwester.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.23) Gecko/20090812 Thunderbird/2.0.0.23 Mnenhy/0.7.6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1255966150-1854-1-git-send-email-marcin@juszkiewicz.com.pl>
	<19c1b8a90910191052i25ebec10q20e2f045cab3914a@mail.gmail.com>
In-Reply-To: <19c1b8a90910191052i25ebec10q20e2f045cab3914a@mail.gmail.com>
X-SA-Exim-Connect-IP: 64.202.165.22
X-SA-Exim-Mail-From: mike@mwester.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Updating kernels to latest stable versions
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
X-List-Received-Date: Mon, 19 Oct 2009 18:09:39 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Khem Raj wrote:
> On Mon, Oct 19, 2009 at 8:28 AM, Marcin Juszkiewicz
> <marcin@juszkiewicz.com.pl> wrote:
>> Some time ago I asked about updating kernels to recent stable patch.
>> There was nearly no discussion on it so this time I am sending mails for
>> review. Did not build checked those patches yet.
> 
> You might have to try builds because there could be some backported
> patches already applied which now are in the new minor release. (I
> haven't looked myself if there is such a case.)

There may also be platform-specific patches that won't apply with the
newer kernel updates, a possibility that is more likely with the
pressure to have maintainers use the generic kernel recipes instead of
just creating their own specific recipe.

And no, I haven't yet looked to see this will be a problem for the
ixp4xx kernels; that's not a big concern and I'll fix that myself should
it be necessary.  I merely mention this to point out that we probably
need to move carefully on blanket updates to the kernel if we wish to
encourage use of the generic kernel recipes -- that's all. :)

Regards,
Mike (mwester)


