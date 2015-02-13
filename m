Return-Path: <hugo.saldanha@aker.com.br>
Received: from asmg.aker.com.br (asmg.aker.com.br [177.159.144.67])
	by mail.openembedded.org (Postfix) with SMTP id C8E7665C85
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Feb 2015 14:18:51 +0000 (UTC)
Received: from mail.aker.com.br (bat.bsb.aker.com.br [10.0.0.20])
	by asmg.aker.com.br [10.0.1.3]; Fri, 13 Feb 2015 12:18:43 -0200
	(envelope-from hugo.saldanha@aker.com.br)
Received: from localhost (10.4.3.1) by mail.aker.com.br (10.0.0.20) with
	Microsoft SMTP Server (TLS) id 8.3.342.0;
	Fri, 13 Feb 2015 12:18:23 -0200
Date: Fri, 13 Feb 2015 12:20:36 -0200
From: Hugo Vasconcelos Saldanha <hugo.saldanha@aker.com.br>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Message-ID: <20150213142036.GC7116@saldanha.aker.com.br>
References: <1423810919-9857-1-git-send-email-schnitzeltony@googlemail.com>
	<1423810919-9857-19-git-send-email-schnitzeltony@googlemail.com>
	<F48900D76F0D8349918584FEEFEB4BCA0629F403@SEXCHANGE0100.lpg.priv>
	<20150213094951.GA14290@mail.itconsulting-heinold.de>
	<F48900D76F0D8349918584FEEFEB4BCA0629F481@SEXCHANGE0100.lpg.priv>
	<1423823635.2285.5.camel@Saturn.local.all>
MIME-Version: 1.0
In-Reply-To: <1423823635.2285.5.camel@Saturn.local.all>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-AkerSMTPGW-ServerID: 5de71414d6a5ac0be1dec76f647836bb21381a41
X-AkerSMTPGW-MessageID: 023f011511cbc595f2588282148793c32a3a7f6b-10o
Subject: Re: package icedtea6-native-1.8.11-r5.3: task do_compile: Failed
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
X-List-Received-Date: Fri, 13 Feb 2015 14:18:55 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Hi,

On Fri, Feb 13, 2015 at 08:33:55AM -0200, Max Krummenacher wrote:
> Hi Daniel
> 
> 
> Am Freitag, den 13.02.2015, 10:08 +0000 schrieb MONDON Daniel:
> > Ok, but my problem is I must not change distribution.
> > The system is installed on many machines, and moving to and other repo will generate too many work (dev and validation)!
> In order to fix an error you will have to change something.
> 
> > I have not enough time to pass on this problem : It was so complicated to build, install and configure Java on angstromv2012.05 environment!
> > 
> > Is it because Ubuntu 12.04 java was updated ?
> No.
> 
> The error you see is because some sources test if now is more than 10 years from 2015 and refuse to compile (and maybe execute later?) if this is the case.
> 
> This is fixed in meta-java, but as Henning said you have to get the
> meta-java layer from git://git.yoctoproject.org/meta-java and update to
> HEAD.

It seems that icedtea7-native was not fixed.

-- 
		Hugo


