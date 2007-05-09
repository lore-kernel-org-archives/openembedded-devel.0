Received: from [62.27.45.185] (helo=argo.arachnion.zzZZzz.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <hacker@klever.net>) id 1Hlkh5-0002ZS-8S
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 May 2007 13:50:57 +0200
Received: from pd9539108.dip0.t-ipconnect.de ([217.83.145.8])
	by argo.arachnion.zzZZzz.net with esmtpa (Exim 4.42)
	id 1Hlkc0-00045d-Ju for openembedded-devel@lists.openembedded.org;
	Wed, 09 May 2007 13:45:40 +0200
Message-ID: <4641B3E4.1020107@klever.net>
Date: Wed, 09 May 2007 13:43:32 +0200
From: Michael Krelin <hacker@klever.net>
User-Agent: Thunderbird 1.5.0.10 (X11/20070321)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <464130FC.7030008@gmail.com>
	<02827798.20070509123821@gmail.com>	<4641A311.4030907@klever.net>
	<4641A5A2.8050108@dominion.kabel.utwente.nl>
In-Reply-To: <4641A5A2.8050108@dominion.kabel.utwente.nl>
X-Enigmail-Version: 0.94.3.0
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
X-List-Received-Date: Wed, 09 May 2007 11:51:07 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

> Michael Krelin schreef:
>>>> UNSHIPPED = "${libdir}/libpython2.4.so ${bindir}/smtpd.py"  #reason why
>>>> not package/ship it
>>>         Who exactly will go over all recipes and add such lines?
>> I take it the proposal was that package maintainers should take care of
>> it. Indeed, it would be better if intentionally unpackaged files invoked
>> no QA notice. But I think the solution is either not install them or rm
>> them after installation, depending on installation procedure nature.
> 
> Or we could patch package.bbclass[1] to do:
> 
> PACKAGES += "${PN}-leftovers"
> FILES_${PN}-leftovers = "/"

I'd rather propose, indeed, packaging the intentional leftovers into a
-leftovers package manually on each package that wants leftovers. But as
you pointed out that there are no valid reasons for files to be
unpackaged, I'm sure it's possible to come up with more meaningful name
for -leftovers package in each particular case. And before files are
packaged QA notice stays QA notice, because it *is* QA issue ;-)


Love,
H


