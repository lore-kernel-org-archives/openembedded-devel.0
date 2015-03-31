Return-Path: <hugo.saldanha@aker.com.br>
Received: from asmg.aker.com.br (asmg.aker.com.br [177.159.144.67])
	by mail.openembedded.org (Postfix) with SMTP id 86B1B736B6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Mar 2015 13:45:14 +0000 (UTC)
Received: from mail.aker.com.br (bat.bsb.aker.com.br [10.0.0.20])
	by asmg.aker.com.br [10.0.1.3]; Tue, 31 Mar 2015 10:44:58 -0300
	(envelope-from hugo.saldanha@aker.com.br)
Received: from localhost (10.4.3.1) by mail.aker.com.br (10.0.0.20) with
	Microsoft SMTP Server (TLS) id 8.3.342.0;
	Tue, 31 Mar 2015 10:45:05 -0300
Date: Tue, 31 Mar 2015 10:47:58 -0300
From: Hugo Vasconcelos Saldanha <hugo.saldanha@aker.com.br>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Message-ID: <20150331134758.GA5096@saldanha.aker.com.br>
References: <1427742371-19160-1-git-send-email-hugo.saldanha@aker.com.br>
	<20150330202507.GA22676@mail.itconsulting-heinold.de>
	<CAP9ODKoLZAv_ae7vJQ1vL_UPTX_mS9t__42Uac7Nf-6ivnNvHg@mail.gmail.com>
	<3AB4D6A9-5462-4A7D-8C7F-0E7FDE38DD18@gmail.com>
	<CAP9ODKrzSGThUHqiV3dCYxbXJk_m-VeCwpVm54c2f2Zu3vmtAQ@mail.gmail.com>
	<A6835A71-8AC7-4456-9C50-24015CBB79FA@gmail.com>
MIME-Version: 1.0
In-Reply-To: <A6835A71-8AC7-4456-9C50-24015CBB79FA@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-AkerSMTPGW-ServerID: d3ca878c259c98dab9711b092908c214d1fd543e
X-AkerSMTPGW-MessageID: 44951a420d5a27c3fc61ab18eb76c53ad8b45fa0-10o
Subject: Re: [meta-java][PATCH] cacao: fix problem with internal garbage collector
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
X-List-Received-Date: Tue, 31 Mar 2015 13:45:19 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Mar 30, 2015 at 11:08:43PM -0300, Khem Raj wrote:
> 
> > On Mar 30, 2015, at 6:42 PM, Otavio Salvador <otavio@ossystems.com.br> wrote:
> > 
> > On Mon, Mar 30, 2015 at 10:40 PM, Khem Raj <raj.khem@gmail.com> wrote:
> >> 
> >>> On Mar 30, 2015, at 5:45 PM, Otavio Salvador <otavio@ossystems.com.br> wrote:
> >>> 
> >>> On Mon, Mar 30, 2015 at 5:25 PM, Henning Heinold
> >>> <henning@itconsulting-heinold.de> wrote:
> >>>> if I remember correctly, than the bdwgc inside cacao differs from upstream.
> >>> 
> >> 
> >> there must be a reason why cacao decided to fork its own copy. Do we know ?
> > 
> > I don't. We could compare the versions and see if it has any change.
> > 
> 
> we should find the reason before we conclude anything and go one  way or other
> sometimes differences are very subtle

Looking at commit log [1], I couldn't find anything that explains why there is
a fork. I was not able to clone the repository, but browsing the source online
I cound only see commits that are upgrades and one that specifically reverts all
CACAO modifications [2].

[1] http://mips.complang.tuwien.ac.at/hg/cacao/
[2] http://mips.complang.tuwien.ac.at/hg/cacao/rev/160a7ee3aa30

-- 
		Hugo


