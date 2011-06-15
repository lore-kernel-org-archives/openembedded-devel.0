Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1QWfQ7-0001e5-R7
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Jun 2011 04:01:28 +0200
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1QWfMo-00048T-F3 from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Jun 2011 18:58:02 -0700
Received: from SVR-ORW-FEM-04.mgc.mentorg.com ([147.34.97.41]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Tue, 14 Jun 2011 18:58:02 -0700
Received: from [172.30.80.132] (147.34.91.1) by svr-orw-fem-04.mgc.mentorg.com
	(147.34.97.41) with Microsoft SMTP Server id 14.1.289.1;
	Tue, 14 Jun 2011 18:58:01 -0700
Message-ID: <4DF8119C.2000106@mentor.com>
Date: Tue, 14 Jun 2011 18:57:48 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1307481663432021500@rkmorris.us> <4DEFBF58.1010903@mentor.com>
	<1308007647883960500@rkmorris.us>
In-Reply-To: <1308007647883960500@rkmorris.us>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 15 Jun 2011 01:58:02.0320 (UTC)
	FILETIME=[A8C1C500:01CC2AFF]
Subject: Re: Builds Failing
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
X-List-Received-Date: Wed, 15 Jun 2011 02:01:28 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 06/13/2011 04:27 PM, Russell Morris wrote:
> Hi,
> Perhaps a dumb question, but ... do I need to do this? I can give it a try (though I'm not quite sure I understand what needs to be changed). Just trying to figure out how to get this working again.
> Thanks!

Since you have a failing setup, yes, please :)

To make git be used as the patch tool, add
PATCHTOOL = "git" to the recipe, increase the PR and add a comment about
why we do this.

-- 
Tom Rini
Mentor Graphics Corporation


