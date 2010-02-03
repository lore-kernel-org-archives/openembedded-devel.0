Received: from qw-out-1920.google.com ([74.125.92.149])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1NckS2-0007SE-Vf
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Feb 2010 19:59:50 +0100
Received: by qw-out-1920.google.com with SMTP id 5so15090qwf.36
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Feb 2010 10:57:20 -0800 (PST)
Received: by 10.229.55.69 with SMTP id t5mr7393qcg.34.1265223440558;
	Wed, 03 Feb 2010 10:57:20 -0800 (PST)
Received: from xora-build.xora.org.uk (188-220-34-37.zone11.bethere.co.uk
	[188.220.34.37])
	by mx.google.com with ESMTPS id 29sm83037970vws.3.2010.02.03.10.57.18
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 03 Feb 2010 10:57:19 -0800 (PST)
Received: by xora-build.xora.org.uk (Postfix, from userid 500)
	id A2BCB4159E; Wed,  3 Feb 2010 18:57:15 +0000 (GMT)
Date: Wed, 3 Feb 2010 18:57:15 +0000
From: Graeme Gregory <dp@xora.org.uk>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100203185715.GA31312@xora-build.xora.org.uk>
References: <1265221914.4267.273.camel@cheeto.emacinc.com>
MIME-Version: 1.0
In-Reply-To: <1265221914.4267.273.camel@cheeto.emacinc.com>
User-Agent: Mutt/1.5.20 (2009-08-17)
X-SA-Exim-Connect-IP: 74.125.92.149
X-SA-Exim-Mail-From: dp@xora.org.uk
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: re-run install task without cleaning
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
X-List-Received-Date: Wed, 03 Feb 2010 18:59:50 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 03, 2010 at 12:31:54PM -0600, Travis Stratman wrote:
> Hello,
> 
> I have been working with Qt embedded and I want to make a subtle change
> to the bitbake script that will only affect the install task (which now
> completes successfully). Normally when I do something like this I just
> clean and build the whole thing over again to get bitbake to use the new
> install task. Just doing a '-c install' won't work because the previous
> build completed successfully.
> 
> Because Qt takes about 2 hours to compile, I'm hoping that there is some
> trick that I am not aware of where I can change and re-run the install
> task (and all subsequent tasks) without rebuilding the whole package.
> 
> Any suggestions?
> 
bitbake blah -c install -f

Graeme



