Return-Path: <philip@balister.org>
Received: from sanddollar.geekisp.com (sanddollar.geekisp.com
	[216.168.135.167])
	by mail.openembedded.org (Postfix) with ESMTP id 299F9782A4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Oct 2017 22:58:09 +0000 (UTC)
Received: (qmail 26878 invoked by uid 1003); 19 Oct 2017 22:58:11 -0000
Received: from unknown (HELO ?192.168.11.142?)
	(philip@opensdr.com@108.44.115.101)
	by mail.geekisp.com with (DHE-RSA-AES128-SHA encrypted) SMTP;
	19 Oct 2017 22:58:11 -0000
To: Kwangsub Kim <kwangsub.kim@qt.io>, Christian Gagneraud <chgans@gmail.com>
References: <1505961647-21967-1-git-send-email-kwangsub.kim@qt.io>
	<CABxGUTixb-TtB0ZQh4k4oi1SCPzXsse9fhwroMh+3MujCqurmA@mail.gmail.com>
	<HE1PR0202MB2491EF42CA7564345575961086660@HE1PR0202MB2491.eurprd02.prod.outlook.com>
	<CABxGUTgSUMy2y3OhCRbXJeVseti77DUc+-e+XsN61BjwW0jT+Q@mail.gmail.com>
	<D38AD408-F299-4144-B45E-5AF22966F458@qt.io>
From: Philip Balister <philip@balister.org>
Message-ID: <81a87496-7295-db4e-32da-66237e99c7de@balister.org>
Date: Thu, 19 Oct 2017 18:58:07 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <D38AD408-F299-4144-B45E-5AF22966F458@qt.io>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH] qt5: add missing commercial license
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
X-List-Received-Date: Thu, 19 Oct 2017 22:58:10 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 8bit

On 10/19/2017 03:07 AM, Kwangsub Kim wrote:
> Hi Christian,
> 
> I think there’s ambiguity in two respects. One is on the logical expression itself (That’s what you pointed out before). And the other one is related to license management of Yocto (or legal liability sometimes). The former is simple and the latter would be complex.
> As far as I know, Qt’s meta-qt5 is almost same as the upstream meta-qt5 at least for license expressions. Basically, Qt is under dual licenses and its license is also declared in the same manner. Currently there’s no explicit option to choose one and it would be selected implicitly with available licenses – it leads to the latter ambiguity. In my humble opinion, it is natural to describe licenses by reflecting the terms in the code like now. For commercial license, the Qt company should guide a correct way to a commercial licensee separately. I believe it is on the way.

Why can't we have one meta-qt5 to reduce confusion?

Philip


> 
> Thanks for your thoughtful messages!
> Kwangsub
> 
> On 15/10/2017, 9:11 PM, "Christian Gagneraud" <chgans@gmail.com> wrote:
> 
>     On 22 September 2017 at 02:31, Kwangsub Kim <kwangsub.kim@qt.io> wrote:
>     > I agree on clearing up complex logical expressions of licenses. But
>     > I think it's another topic because it would need wider updates including
>     > the other packages unrelated to commercial license fix.
>     > What about discussing about it on new thread after this patch?
>     
>     Yeah, maybe. Does Yocto care about license ambiguity? My understanding
>     was that yes it does.
>     The pitch is that it's one of the Yocto's strength: get a clear
>     picture about license issue, isn't it?
>     
>     I've been following and using yocto/bitbake/oe/poky/angstrom/... for a
>     wee while now and i think that the current state of licensing is
>     out-of-control, yet Yocto/LF pretends to be in full-control.
>     
>     Qt licensing is not an easy topic. The Linux Fundation needs to be
>     razor sharp about it.
>     
>     What can i access from meta-qt5 in [L]GPLv(2|3) mode?
>     Is LF's meta-qt5 safer than Qt's own meta-qt5?
>     
>     What i can access with a commercial Qt license as of October 2017 is
>     purely a "The Qt Company" business decision.
>     
>     "Hackers" wan't to know, without ambiguity, what they have access to
>     given a "license" context (Open source or commercial).
>     
>     My 2 cents.
>     Chris
>     
> 

