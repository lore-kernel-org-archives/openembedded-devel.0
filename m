Return-Path: <hugo.saldanha@aker.com.br>
Received: from asmg.aker.com.br (asmg.aker.com.br [177.159.144.67])
	by mail.openembedded.org (Postfix) with SMTP id A46586017E
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Mar 2015 21:34:42 +0000 (UTC)
Received: from mail.aker.com.br (bat.bsb.aker.com.br [10.0.0.20])
	by asmg.aker.com.br [10.0.1.3]; Wed, 4 Mar 2015 18:34:31 -0300
	(envelope-from hugo.saldanha@aker.com.br)
Received: from localhost (10.4.3.1) by mail.aker.com.br (10.0.0.20) with
	Microsoft SMTP Server (TLS) id 8.3.342.0; Wed, 4 Mar 2015 18:33:58 -0300
Date: Wed, 4 Mar 2015 18:36:44 -0300
From: Hugo Vasconcelos Saldanha <hugo.saldanha@aker.com.br>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Message-ID: <20150304213644.GB1017@saldanha.aker.com.br>
References: <1425487144-27730-1-git-send-email-javier.viguera@digi.com>
MIME-Version: 1.0
In-Reply-To: <1425487144-27730-1-git-send-email-javier.viguera@digi.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-AkerSMTPGW-ServerID: 9d8a42c85af83ce3f1288210c5ee75ced62afa1c
X-AkerSMTPGW-MessageID: 009d3fde095fc2855a72125b1ec3125f658baa43-10o
Subject: Re: [meta-networking][PATCH] crda: move libgcrypt to DEPENDS
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
X-List-Received-Date: Wed, 04 Mar 2015 21:34:46 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Hi,

On Wed, Mar 04, 2015 at 01:39:04PM -0300, Javier Viguera wrote:
> crda has a build time dependence on libgcrypt, so move the dependence
> from RDEPENDS to DEPENDS.
> 
> Otherwise the build fails with:
> 
> reglib.c:28:20: fatal error: gcrypt.h: No such file or directory
> 
> Signed-off-by: Javier Viguera <javier.viguera@digi.com>

I think you should move libnl to DEPENDS also. My bad. :(


-- 
		Hugo


