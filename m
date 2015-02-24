Return-Path: <hugo.saldanha@aker.com.br>
Received: from asmg.aker.com.br (asmg.aker.com.br [177.159.144.67])
	by mail.openembedded.org (Postfix) with SMTP id B018871633
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Feb 2015 18:08:45 +0000 (UTC)
Received: from mail.aker.com.br (bat.bsb.aker.com.br [10.0.0.20])
	by asmg.aker.com.br [10.0.1.3]; Tue, 24 Feb 2015 15:08:32 -0300
	(envelope-from hugo.saldanha@aker.com.br)
Received: from localhost (10.4.3.1) by mail.aker.com.br (10.0.0.20) with
	Microsoft SMTP Server (TLS) id 8.3.342.0;
	Tue, 24 Feb 2015 15:08:41 -0300
Date: Tue, 24 Feb 2015 15:10:46 -0300
From: Hugo Vasconcelos Saldanha <hugo.saldanha@aker.com.br>
To: Otavio Salvador <otavio@ossystems.com.br>
Message-ID: <20150224181045.GF1284@saldanha.aker.com.br>
References: <F81DC1078564A34BB4DA30CAE03814D1276975E1@ORSMSX104.amr.corp.intel.com>
	<CAP9ODKo1c8NuZvTY-j+dbiYVeRo4Qe6HdqHEdiZULPxNb4ASpQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKo1c8NuZvTY-j+dbiYVeRo4Qe6HdqHEdiZULPxNb4ASpQ@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-AkerSMTPGW-ServerID: 5de71414d6a5ac0be1dec76f647836bb21381a41
X-AkerSMTPGW-MessageID: 37fe78b2cdb308742a31ab9a8ba617e94025f409-10o
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: iecedtea7-native will not build. Possible fix attached
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
X-List-Received-Date: Tue, 24 Feb 2015 18:08:49 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Feb 24, 2015 at 02:08:20PM -0300, Otavio Salvador wrote:
> On Tue, Feb 24, 2015 at 3:37 AM, Bruce, Henry <henry.bruce@intel.com> wrote:
> > Hello openjdk community,
> >
> > iecedtea7-native from git://git.yoctoproject.org/meta-java doesn't build due to well documented Turkish currency expiration problem. This has been fixed for icedtea6 so I borrowed the patch (not sure if this is appropriate) and put into a the attached bbappend that fixes the problem. I went with a bbappend as I wasn't sure of the process for patching a recipe. Resulting JVM seems to work for my application.
> 
> Check the current patchset which Hugo has sent (now in Cc) as I think
> this address the issue you had.
> 

That is true. I've just taken a different approach, based on what was done
with openjdk-7, but essentially the patch does the same thing.

-- 
		Hugo


