Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1Tyhtf-0001zG-7k
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Jan 2013 12:56:39 +0100
Received: by tygrysek.juszkiewicz.com.pl (Postfix, from userid 65534)
	id 7FE95D22E9; Fri, 25 Jan 2013 12:41:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	tygrysek.juszkiewicz.com.pl
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from [192.168.1.112] (87-206-60-225.dynamic.chello.pl
	[87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 7D4A7D22CD
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Jan 2013 12:40:31 +0100 (CET)
Message-ID: <51026F2D.5000503@linaro.org>
Date: Fri, 25 Jan 2013 12:40:29 +0100
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130105 Thunderbird/17.0.2
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <51026A2D.1030705@nedap.com>
In-Reply-To: <51026A2D.1030705@nedap.com>
Subject: Re: best practice for different projects on the same board
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
X-List-Received-Date: Fri, 25 Jan 2013 11:56:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

W dniu 25.01.2013 12:19, Jaap de Jong pisze:
> Hi All,
> I'm wondering what the best practice would be in the following situation.
> We have a board that is going to be used in several projects.
> The set of basic packages is the same but every project might have some
> minor and perhaps sometimes major differences in f.i. config files.
> I don't want to make a copy of the base project for every upcoming new
> project. I would really like to handle with the differences only.
> What is the best approach for this?

Create conf/machine/board1.conf and describe everything there. Set
kernel etc. Then create conf/machine/board2.conf which will "require
conf/machine/board1.conf" and then change what is needed.

This way you have two values of MACHINE variable which you can use in
all recipes you need to modify for boards. And you are able to do builds
with one TMPDIR so most of builds will be reused.



