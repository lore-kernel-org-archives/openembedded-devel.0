Return-Path: <philip@balister.org>
Received: from starfish.geekisp.com (starfish.geekisp.com [216.168.135.166])
	by mail.openembedded.org (Postfix) with SMTP id 4623F65F77
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Oct 2014 19:50:43 +0000 (UTC)
Received: (qmail 16763 invoked by uid 1003); 1 Oct 2014 19:50:44 -0000
Received: from unknown (HELO ?10.16.32.132?)
	(philip@opensdr.com@209.234.137.234)
	by mail.geekisp.com with (DHE-RSA-AES128-SHA encrypted) SMTP;
	1 Oct 2014 19:50:44 -0000
Message-ID: <542C5B13.7050608@balister.org>
Date: Wed, 01 Oct 2014 12:50:43 -0700
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <542AE566.80708@balister.org>
	<CAMKF1soHgDHBUiStGqaW28L8jWu63HmoaHBdYavie0r=dFZ+7g@mail.gmail.com>
In-Reply-To: <CAMKF1soHgDHBUiStGqaW28L8jWu63HmoaHBdYavie0r=dFZ+7g@mail.gmail.com>
Subject: Re: Hostapd recipe is DEFAULT_PREFENCE = "-1"
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
X-List-Received-Date: Wed, 01 Oct 2014 19:50:52 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 09/30/2014 06:23 PM, Khem Raj wrote:
> On Tue, Sep 30, 2014 at 10:16 AM, Philip Balister <philip@balister.org> wrote:
>> Does anyone know why the hostapd recipe is DEFAULT_PREFERENCE = "-1"
> 
> history !!. it was imported from oe-classic and there we had multiple
> recipes and default was 0.5.10
> but latest was 1.0 which was brought into new world and needless to
> say it was verbatim
> 

I figured this out :) Once I verify it works I plan to send in a patch
to remove the DEFAULT_PREFERENCE. I was just trying to figure out if
anyone had a good reason for leaving it in :)

Philip

