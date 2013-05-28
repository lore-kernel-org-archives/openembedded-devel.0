Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id E9D1B6A58A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 May 2013 22:42:36 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id F3A7CF81202; Tue, 28 May 2013 16:42:34 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 184EBF811F1;
	Tue, 28 May 2013 16:42:34 -0600 (MDT)
Message-ID: <51A532E0.8070806@mlbassoc.com>
Date: Tue, 28 May 2013 16:42:40 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130510 Thunderbird/17.0.6
MIME-Version: 1.0
To: =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>
References: <1369604103-31315-1-git-send-email-raj.khem@gmail.com>
	<1369604103-31315-2-git-send-email-raj.khem@gmail.com>
	<51A4C7C1.6050706@mlbassoc.com> <20130528171024.51624971@e6520eb>
In-Reply-To: <20130528171024.51624971@e6520eb>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-browser][PATCH 2/2] chromium: Add recipes for 29.0.1518
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
X-List-Received-Date: Tue, 28 May 2013 22:42:37 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2013-05-28 09:10, Eric Bénard wrote:
> Hi Gary,
>
> Le Tue, 28 May 2013 09:05:37 -0600,
> Gary Thomas <gary@mlbassoc.com> a écrit :
>> Have you tried this?  I just built it for my ARMv7a (i.MX6Q SabreLite) and it
>> seems to hang up on any page that uses JavaScript.  Try most any of the links
>> on the "Chrome Help" page.
>>
>> Maybe I'm missing something?
>>
> can you try to change
>      'v8_use_snapshot': 1,
>
> to
>      'v8_use_snapshot': 0,
>
> in oe-defaults.gypi ?

It looks like I was mistaken about this - it does seem to work
(but wasn't immediately obvious to me).  Sorry for the noise.

Note: I have tested it with both settings of v8_use_snapshot and
they seem to behave the same.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

