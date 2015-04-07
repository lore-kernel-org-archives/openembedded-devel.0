Return-Path: <philip@balister.org>
Received: from starfish.geekisp.com (starfish.geekisp.com [216.168.135.166])
	by mail.openembedded.org (Postfix) with SMTP id B0D8660043
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Apr 2015 14:00:13 +0000 (UTC)
Received: (qmail 9492 invoked by uid 1003); 7 Apr 2015 14:00:14 -0000
Received: from unknown (HELO ?192.168.11.132?)
	(philip@opensdr.com@108.44.116.31)
	by mail.geekisp.com with (DHE-RSA-AES128-SHA encrypted) SMTP;
	7 Apr 2015 14:00:14 -0000
Message-ID: <5523E2EE.7020904@balister.org>
Date: Tue, 07 Apr 2015 10:00:14 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <5523E21B.5070100@mlbassoc.com>
In-Reply-To: <5523E21B.5070100@mlbassoc.com>
Subject: Re: Issues building vlc
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
X-List-Received-Date: Tue, 07 Apr 2015 14:00:15 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 04/07/2015 09:56 AM, Gary Thomas wrote:
> I'm trying to build vlc and I get this error:
> ERROR: Multiple .bb files are due to be built which each provide jpeg
> (/local/poky-cutting-edge/meta-oe/recipes-core/jpeg/libjpeg-turbo_8d+1.4.0.bb
> /local/poky-cutting-edge/meta/recipes-core/jpeg/jpeg_8d.bb).
>  This usually means one provides something the other doesn't and should.
> 
> This comes from the fact that vlc depends on libjpeg-turbo
> which conflicts with the main jpeg library in OE-core.
> 
> What's the best way to fix this?

This page starts to explain:

http://openembedded.org/wiki/PREFERRED_PROVIDER_for_jpeg_and_jpeg-native

It could use some work explaining the difference between the two
alternatives.

Philip

> 
> Thanks
> 

