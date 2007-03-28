Received: from [213.199.154.16] (helo=outbound2-dub-R.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <Tim.Bird@am.sony.com>) id 1HWcLB-0005ww-7W
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Mar 2007 19:53:45 +0200
Received: from outbound2-dub.bigfish.com (localhost.localdomain [127.0.0.1])
	by outbound2-dub-R.bigfish.com (Postfix) with ESMTP id 75AF1D67961;
	Wed, 28 Mar 2007 17:53:44 +0000 (UTC)
Received: from mail25-dub-R.bigfish.com (unknown [10.5.252.3])
	by outbound2-dub.bigfish.com (Postfix) with ESMTP id 67CAB1930043;
	Wed, 28 Mar 2007 17:53:44 +0000 (UTC)
Received: from mail25-dub (localhost.localdomain [127.0.0.1])
	by mail25-dub-R.bigfish.com (Postfix) with ESMTP id B3A065C81BD;
	Wed, 28 Mar 2007 17:53:43 +0000 (UTC)
X-BigFish: VP
Received: by mail25-dub (MessageSwitch) id 1175104423715533_2908;
	Wed, 28 Mar 2007 17:53:43 +0000 (UCT)
Received: from mail8.fw-bc.sony.com (mail8.fw-bc.sony.com [160.33.98.75])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail25-dub.bigfish.com (Postfix) with ESMTP id E822710B004F;
	Wed, 28 Mar 2007 17:53:42 +0000 (UTC)
Received: from mail1.sgo.in.sel.sony.com (mail1.sgo.in.sel.sony.com
	[43.130.1.111])
	by mail8.fw-bc.sony.com (8.12.11/8.12.11) with ESMTP id l2SHrft8029050; 
	Wed, 28 Mar 2007 17:53:41 GMT
Received: from USSDIXIM01.am.sony.com (ussdixim01.am.sony.com [43.130.140.33])
	by mail1.sgo.in.sel.sony.com (8.12.11/8.12.11) with ESMTP id
	l2SHrfFN018447; Wed, 28 Mar 2007 17:53:41 GMT
Received: from ussdixms03.am.sony.com ([43.130.140.23]) by
	USSDIXIM01.am.sony.com with Microsoft SMTPSVC(5.0.2195.6713); 
	Wed, 28 Mar 2007 10:53:36 -0700
Received: from [43.134.85.135] ([43.134.85.135]) by ussdixms03.am.sony.com
	with Microsoft SMTPSVC(5.0.2195.6713); 
	Wed, 28 Mar 2007 10:53:35 -0700
Message-ID: <460AABD1.4080409@am.sony.com>
Date: Wed, 28 Mar 2007 10:54:25 -0700
From: Tim Bird <tim.bird@am.sony.com>
User-Agent: Thunderbird 1.5.0.4 (X11/20060614)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20070320033120.GA8678@thegnar.org>	<1174574086.5949.32.camel@localhost.localdomain>	<20070323043126.GA893@thegnar.org>
	<1174641616.5813.9.camel@localhost.localdomain>
In-Reply-To: <1174641616.5813.9.camel@localhost.localdomain>
X-Enigmail-Version: 0.94.0.0
X-OriginalArrivalTime: 28 Mar 2007 17:53:36.0009 (UTC)
	FILETIME=[02256F90:01C77162]
Subject: Re: bitbake and OE opperation
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
X-List-Received-Date: Wed, 28 Mar 2007 17:53:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Richard Purdie wrote:
> 
>> What triggers do_configure to be executed and when?
> 
> Read base.bbclass. It sets up a number of tasks and a default task,
> "build". You'd add configure after patch, before compile. compile would
> be before build. "bitbake somefile" would cause the default task (and
> its dependent tasks) to be executed. You could also do "bitbake somefile
> -c configure" to specifically execute the configure task.

I'm sorry, but I don't understand most of that paragraph.

I've read the manuals - maybe I missed it, but I have the same question.

In <oe>/classes/base.bbclass I see:

BB_DEFAULT_TASK = "build"

at the top of the file.

There's no "def build()" or "def do_build()"
There are the following lines - I don't know if they're related or not:

addtask build after do_populate_staging
do_build = ""
do_build[func] = "1"

In <bitbake>/classes/base.bbclass I see:

addtask build
do_build[dirs] = "${TOPDIR}"
do_build[nostamp] = "1"
python base_do_build () {
        bb.note("The included, default BB base.bbclass does not define a useful default task.")
        bb.note("Try running the 'listtasks' task against a .bb to see what tasks are defined.")
}

Maybe I'm thinking procedurally, and this is all declarative, but where
the heck are the actual statements executed during a "build"?

Back to Mark's point, how are the stages "fetch", "compile", "install"
known to the system, and sequenced.  Are these hardcoded in bitbake?
I'm guessing not, from the answer above and the structure of the
"addtask <foo> before|after <bar>" statements.  But I can't find
anywhere in the bbclass files where this is expressed.

Please help me understand this.

Thanks,
 -- Tim

=============================
Tim Bird
Architecture Group Chair, CE Linux Forum
Senior Staff Engineer, Sony Electronics
=============================



