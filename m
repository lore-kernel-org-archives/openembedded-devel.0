Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 13D74602D9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 May 2016 08:33:23 +0000 (UTC)
Received: from [172.16.1.106] (62-178-118-86.cable.dynamic.surfer.at
	[62.178.118.86]) by ptmx.org (Postfix) with ESMTPSA id 799F730520
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 May 2016 10:33:23 +0200 (CEST)
To: openembedded-devel@lists.openembedded.org
References: <5745392B.4030307@mlbassoc.com>
From: Carlos Rafael Giani <dv@pseudoterminal.org>
Message-ID: <57456352.2080407@pseudoterminal.org>
Date: Wed, 25 May 2016 10:33:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <5745392B.4030307@mlbassoc.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-qt5] build error
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 25 May 2016 08:33:24 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Is this a qtbase build with X11 enabled?
EGL with X11 on i.MX6 might be broken. I know it was once before.

"#error qtextstream.h must be included before any header file that 
defines Status" indicates as much. "Status" is one of those wonderful 
X11 definitions with super generic names. If the Vivante EGL headers 
include X11 headers it might be causing problems here.

On 2016-05-25 07:33, Gary Thomas wrote:
> I just tried to build qtbase for my i.MX6Q target and it failed
> miserably (tons of compile errors).  I'm using Poky master(c7e614c438706)
> with GCC 4.9.3.  Error log attached.
>
> Any ideas what I'm missing?
>
>
>


