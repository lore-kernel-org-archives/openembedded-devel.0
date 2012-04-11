Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1SHv5O-0004rq-Cp
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Apr 2012 12:47:38 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id BF96AF81204; Wed, 11 Apr 2012 04:38:20 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from hermes.chez-thomas.org (localhost.localdomain [127.0.0.1])
	by mail.chez-thomas.org (Postfix) with ESMTP id CB012F811FF;
	Wed, 11 Apr 2012 04:38:18 -0600 (MDT)
Message-ID: <4F855F1A.6090700@mlbassoc.com>
Date: Wed, 11 Apr 2012 04:38:18 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <CAOHjBZuGf-wG2jpSR1R9sM_KawN+5H9ZS_ivikYgfMvLJVVtXQ@mail.gmail.com>
In-Reply-To: <CAOHjBZuGf-wG2jpSR1R9sM_KawN+5H9ZS_ivikYgfMvLJVVtXQ@mail.gmail.com>
Subject: Re: [oe-core] THISDIR usage
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
X-List-Received-Date: Wed, 11 Apr 2012 10:47:38 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2012-04-11 04:23, Giuseppe Condorelli wrote:
> Hi, I moved to OE-Core (working on stable version dowloaded as tar file
> from cgit.openembedded.org).
> I'm in trouble trying to include a source through .bbappend file, located
> under my meta-<personal>  subtree.
>
> FILESPATHBASE_prepend := "${THISDIR}/files:"
> SRC_URI += "file://myfile.tar.gz"
>
> results in a no such file or directory. Please can you tell me if I'm
> missing anything?

Assuming your tree looks something like this [partial]:

   meta-giuseppe:
     recipes:
       some-recipe:
         some-recipe_1.2.3.bbappend
         files:
           myfile.tar.gz

Try using this instead
   FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


