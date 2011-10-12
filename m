Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1RDy66-0007fJ-L5
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Oct 2011 14:39:46 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 999)
	id C8E976AACAE; Wed, 12 Oct 2011 06:34:04 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from hermes.chez-thomas.org (localhost.localdomain [127.0.0.1])
	by mail.chez-thomas.org (Postfix) with ESMTP id 440A76AACAD;
	Wed, 12 Oct 2011 06:34:04 -0600 (MDT)
Message-ID: <4E95893C.6050903@mlbassoc.com>
Date: Wed, 12 Oct 2011 06:34:04 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:7.0.1) Gecko/20110930 Thunderbird/7.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <CAObi9r9=55i4W686VfCv-TGSChsrewu7zSGUsPZC2PbA3x3zbQ@mail.gmail.com>
In-Reply-To: <CAObi9r9=55i4W686VfCv-TGSChsrewu7zSGUsPZC2PbA3x3zbQ@mail.gmail.com>
Subject: Re: Creating Rootfs images without packages
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
X-List-Received-Date: Wed, 12 Oct 2011 12:39:46 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2011-10-12 06:22, mgundes wrote:
>     Hi,
>
>     I think one of the big issue with OE is build time. It does everything
> for you, so that it takes too much times. I want to minimize build time and
> realized that OE creates ipkgs for almost every package. If there is a way

Not true.  Only the packages needed to complete your image will be built.

That said, there are some packages which are built (the first time only) that
comprise the build environment and tool chain which takes a lot of time, but
this is only the first time through.

What image & target are you building for and what packages are built that you
don't think needed to be built?

> to prevent creation of ipkgs it would be really good for me. In my opinion,
> it would be fine for other people too since usually rootfs directory is
> enough and ipkgs are not frequently used directly by developers.
>
>     I have asked in freenode oe room but friends said there no way to do that
> in OE system. If there is no way to do that in current OE, do you plan to
> add as a feature?
>
>     Thanks,
>
> Regards
>

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


