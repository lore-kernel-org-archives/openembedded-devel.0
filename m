Received: from [64.233.182.191] (helo=nf-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <cliff.brake@gmail.com>) id 1H1XAi-0006SU-Le
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Jan 2007 01:06:28 +0100
Received: by nf-out-0910.google.com with SMTP id l24so6530043nfc
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Jan 2007 16:05:28 -0800 (PST)
Received: by 10.78.204.1 with SMTP id b1mr1822414hug.1167696328471;
	Mon, 01 Jan 2007 16:05:28 -0800 (PST)
Received: by 10.78.164.9 with HTTP; Mon, 1 Jan 2007 16:05:28 -0800 (PST)
Message-ID: <f96d234e0701011605y4628caej8c85532117f40827@mail.gmail.com>
Date: Mon, 1 Jan 2007 19:05:28 -0500
From: "Cliff Brake" <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20061230051641.GA30225@hezmatt.org>
MIME-Version: 1.0
References: <20061230051641.GA30225@hezmatt.org>
Subject: Re: A question of workflow
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 02 Jan 2007 00:06:28 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 12/30/06, Matthew Palmer <mpalmer@hezmatt.org> wrote:

> * (The biggie) is there a guide on the wiki or somewhere describing the
>   preferred workflow for making changes and working effectively with the rest
>   of the OE developer community?  (Google wasn't at all illuminating)

Many of us use bbcollections to keep any OE changes in a completely
separate OE tree and don't modify the dev tree.  The components in the
custom tree are given higher priority and in effect replace the
components in the dev tree.  This works very well for the case where
you are working on a project and have quite a bit of custom
development that will never get pushed into dev.  This is far from
ideal, but is the best solution I've found.

Cliff

-- 
=======================
Cliff Brake
http://bec-systems.com


