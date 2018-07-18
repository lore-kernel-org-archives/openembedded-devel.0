Return-Path: <mmcclain@uplogix.com>
Received: from s05-gw002.mycloudmailbox.com (s05-gw002.mycloudmailbox.com
	[199.244.76.202])
	by mail.openembedded.org (Postfix) with ESMTP id 6FD2178911
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Jul 2018 16:26:56 +0000 (UTC)
Received: from S05-MBX04-11.S05.local (unknown [10.30.33.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by s05-gw002.mycloudmailbox.com (Postfix) with ESMTPS id
	41W2bj17m6zVhTC; Wed, 18 Jul 2018 12:26:57 -0400 (EDT)
Received: from sprocket.local (10.30.32.130) by S05-MBX04-11.S05.local
	(10.30.33.98) with Microsoft SMTP Server (TLS) id 15.0.1367.3;
	Wed, 18 Jul 2018 12:26:56 -0400
To: Richard Leitner <richard.leitner@skidata.com>,
	<openembedded-devel@lists.openembedded.org>
References: <20180717192023.77954-1-mmcclain@uplogix.com>
	<e10e814a-c8ce-3edd-015e-72ce90397b2b@skidata.com>
From: Matthew McClain <mmcclain@uplogix.com>
Message-ID: <cd12420f-5b08-c144-a5f6-11d9592c8bc1@uplogix.com>
Date: Wed, 18 Jul 2018 11:26:55 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
	Gecko/20100101 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <e10e814a-c8ce-3edd-015e-72ce90397b2b@skidata.com>
X-Originating-IP: [10.30.32.130]
X-ClientProxiedBy: S05-CAS007.S05.local (10.30.32.57) To
	S05-MBX04-11.S05.local (10.30.33.98)
X-RoutingAgent: Treated
Subject: Re: [meta-java][PATCH] openjdk-8: 'do_unpack_remove_X11_wrappers' confuses pyro bitbake parser
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 18 Jul 2018 16:26:56 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 7/18/18 12:36 AM, Richard Leitner wrote:
> On 07/17/2018 09:20 PM, Matthew McClain wrote:
>> Renaming the function to anything else allows the recipe to be 
>> parsed.  The
>> problem appears to be the word "_remove_".  This affects both the 
>> sumo and
>> master branches.
>
> In the subject you say it causes problems with the pyro branch, but 
> here you say sumo and master... So which branches are really affected? 
> Can you please adapt the title/commit-message accordingly?
>
The issue is with building the sumo or master branches of meta-java
with the pyro branches of meta-poky, meta-oe, etc.  I should just put
this in the summary.

I suspect it's because _remove (like _append) is used to modify variables.

> If I get it right the mentioned parsing error only occurs when we have 
> no X11 (in PACKAGECONFIG). Is that true? Can you please mention it in 
> the commit message?
If I comment out the do_unpack[postfuncs] line, the recipe parses fine,
so I would assume if X11 is configured, it would be fine.


I didn't include the error in the summary as it's long and messy.

                      parser = bb.codeparser.ShellParser(key, logger)
     >                parser.parse_shell(parsedvar.value)
                      deps = deps | shelldeps
   File "/home/test/yocto/poky/bitbake/lib/bb/codeparser.py", line 361, 
in ShellParser.parse_shell(value=None):

     >        self._parse_shell(value)
              self.execs = set(cmd for cmd in self.allexecs if cmd not 
in self.funcdefs)
   File "/home/test/yocto/poky/bitbake/lib/bb/codeparser.py", line 370, 
in ShellParser._parse_shell(value=None):
              try:
     >            tokens, _ = pyshyacc.parse(value, eof=True, debug=False)
              except pyshlex.NeedMore:
   File "/home/test/yocto/poky/bitbake/lib/bb/pysh/pyshyacc.py", line 
668, in parse(input=None, eof=True, debug=False):
          lexer = pyshlex.PLYLexer()
     >    remaining = lexer.add(input, eof)
          if lexer.is_empty():
   File "/home/test/yocto/poky/bitbake/lib/bb/pysh/pyshlex.py", line 
580, in PLYLexer.add(data=None, eof=True):
              """
     >        self._input += list(data)
              self._parse(eof)
TypeError: 'NoneType' object is not iterable


Thanks,
Matthew

