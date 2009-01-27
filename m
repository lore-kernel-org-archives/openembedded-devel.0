Received: from [74.125.44.154] (helo=yx-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jkridner@beagleboard.org>) id 1LRseU-0006ZW-Ex
	for Openembedded-devel@lists.openembedded.org;
	Tue, 27 Jan 2009 19:27:10 +0100
Received: by yx-out-1718.google.com with SMTP id 4so2701588yxp.42
	for <Openembedded-devel@lists.openembedded.org>;
	Tue, 27 Jan 2009 10:19:37 -0800 (PST)
MIME-Version: 1.0
Received: by 10.143.18.21 with SMTP id v21mr2291073wfi.336.1233080376515; Tue, 
	27 Jan 2009 10:19:36 -0800 (PST)
In-Reply-To: <A69FA2915331DC488A831521EAE36FE4012470D042@dlee06.ent.ti.com>
References: <5899DAF1-278D-43D5-8C90-BECD7FC3E4B5@beagleboard.org>
	<f20732e90901270708t65dc4a67jfe0829bb6ca4c540@mail.gmail.com>
	<B1B8AC48-51AB-435E-A431-AC1494B171DA@beagleboard.org>
	<670B7A54-3C74-42FD-A6F8-DAAFD4AEC73A@beagleboard.org>
	<A69FA2915331DC488A831521EAE36FE4012470D042@dlee06.ent.ti.com>
Date: Tue, 27 Jan 2009 12:19:36 -0600
Message-ID: <f20732e90901271019s6f2fa8abvc596f72091decdef@mail.gmail.com>
From: Jason Kridner <jkridner@beagleboard.org>
To: beagleboard@googlegroups.com, Openembedded-devel@lists.openembedded.org
Subject: Re: [beagleboard] Re: Beagle actions for Rev C validation software image
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
X-List-Received-Date: Tue, 27 Jan 2009 18:27:10 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Adding oe-dev mailing list...

On Tue, Jan 27, 2009 at 12:10 PM, Dmytriyenko, Denys <denys@ti.com> wrote:
>
>>> It's a bit sad that we're going to miss out on NEON and vo_omapfb by
>>> going armv5te :(
>
>> Koen,
>
>> I am rebuilding 'mplayer' now with 'MACHINE=beagleboard bitbake mplayer', so that concern should go away.  It shouldn't matter much about this mplayer, since it should only be used to test the hardware.
>
>> Can you consider inclusion of:
>
>> mplayer and FFmpeg dependency changes:
>> http://www.beagleboard.org/gitweb/?p=arago-oe.git;a=commitdiff_plain;h=0b53219005c8daa95bcff40742d7c807bda17eca
>
> Hmm, I like these curl-inspired *_FEATURES handlers. The only problem with those is they won't trigger automatic rebuild when the featureset in the variable changes - don't forget to run bitbake -c rebuild manually...
>

Can I get a few comments on [1]?  I found there is also a dependency
in libtheora on x11 that doesn't seem necessary.  I find this very
useful to avoid making a new recipe.  Anyone have ideas to address
Denys' concern about needing to issue 'bitbake -c rebuild'?

[1] http://www.beagleboard.org/gitweb/?p=arago-oe.git;a=commitdiff_plain;h=0b53219005c8daa95bcff40742d7c807bda17eca


