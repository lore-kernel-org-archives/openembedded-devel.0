Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id EEB8E60017
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Jun 2015 19:13:51 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id D063EF811DB; Tue, 30 Jun 2015 13:13:52 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=10.0 tests=ALL_TRUSTED,BAYES_00,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 57063F811DB;
	Tue, 30 Jun 2015 13:13:52 -0600 (MDT)
Message-ID: <5592EA9D.2070902@mlbassoc.com>
Date: Tue, 30 Jun 2015 13:14:37 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <5592B122.4020208@mlbassoc.com>	<CAJTo0LamNSDWoNX8YZ7ytqUcMd=yP4Dx=smkfcBU9jf3hnUGpA@mail.gmail.com>	<5592B9E5.5000402@mlbassoc.com>
	<CAJTo0LYWCvG9oog=GwVMjqEB2RM_zAT_Vr8zO2tX=9WeKbdPXQ@mail.gmail.com>
In-Reply-To: <CAJTo0LYWCvG9oog=GwVMjqEB2RM_zAT_Vr8zO2tX=9WeKbdPXQ@mail.gmail.com>
Subject: Re: [meta-browser] New chromium warnings
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
X-List-Received-Date: Tue, 30 Jun 2015 19:13:52 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2015-06-30 13:10, Burton, Ross wrote:
> On 30 June 2015 at 16:46, Gary Thomas <gary@mlbassoc.com> wrote:
>
>> They are coming from
>> meta-fsl-arm/browser-layer/recipes-browser/chromium/chromium-imx.inc
>> and my local.conf.  The chromium recipe checks the PACKAGECONFIG variable
>> for these settings, but is not using PACKAGECONFIG the normal way.  It's
>> just the warnings that are new.
>>
>> I suspect the chromium recipe(s) need to be rewritten to play nice
>> with PACKAGECONFIG...
>>
>
> I'm pleased we've got the warning, but recipes that are using a
> PACKAGECONFIG variable to configure stuff but then not actually using the
> PACKAGECONFIG machinery now need to add stub definitions for each of the
> flags they're using:
>
> PACKAGECONFIG[use-gl] = ""
> etc
>

As I expected.  I'll send a patch for this.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

