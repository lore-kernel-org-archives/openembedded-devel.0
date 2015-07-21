Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id 8FFCC73694
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jul 2015 15:36:17 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 93343F811DB; Tue, 21 Jul 2015 09:36:17 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=10.0 tests=ALL_TRUSTED,BAYES_00,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 2C6F2F811DA;
	Tue, 21 Jul 2015 09:36:17 -0600 (MDT)
Message-ID: <55AE6705.5040907@mlbassoc.com>
Date: Tue, 21 Jul 2015 09:36:37 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: yocto@yoctoproject.org
References: <CAK5mtexdmYF7ivs+nwa7WZSqVb8sZCq5Euvt8oK2HimiXy7PMA@mail.gmail.com>
In-Reply-To: <CAK5mtexdmYF7ivs+nwa7WZSqVb8sZCq5Euvt8oK2HimiXy7PMA@mail.gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [yocto] Question about IMAGE_INSTALL_append and CORE_IMAGE_EXTRA_INSTALL
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
X-List-Received-Date: Tue, 21 Jul 2015 15:36:20 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2015-07-21 09:26, Victor Rodriguez wrote:
> Hi team
>
> I have a question , according to documentation there is a difference between
>
> IMAGE_INSTALL_append
>
> and
>
> CORE_IMAGE_EXTRA_INSTALL
>
> Specifies the list of packages to be added to the image. You should
> only set this variable in the local.conf configuration file found in
> the Build Directory.
>
> When I use the second one and try to build a core-image-minimal-xfce
> bitbake does not install what I wanted in my image . I had a really
> hard time few weekends ago because of this.
>
> I wonder If I am missing something or if this is a bug

The core-image-minimal-xfce recipe does not "play nice" with
the core-image class and is not respecting CORE_IMAGE_EXTRA_INSTALL.

I think this should be filed as a bug (and feel free to suggest a patch)

BTW, this question should really be on the OpenEmbedded development list.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

