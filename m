Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1Nrq6d-0005Bg-Qw
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Mar 2010 11:04:05 +0100
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id o2HA0vNH027639
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Mar 2010 11:00:58 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.69) (envelope-from <ensc@sigma-chemnitz.de>) id 1Nrq3d-0006dt-5P
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Mar 2010 11:00:57 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-devel@lists.openembedded.org
References: <1268742232-11291-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
	<1268791537.20395.6.camel@trini-m4400>
Date: Wed, 17 Mar 2010 11:00:57 +0100
In-Reply-To: <1268791537.20395.6.camel@trini-m4400> (Tom Rini's message of
	"Tue, 16 Mar 2010 19:05:37 -0700")
Message-ID: <lyocinjmhy.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.1 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-Scanned-By: MIMEDefang 2.67 on 62.153.82.30
X-SA-Exim-Connect-IP: 62.153.82.30
X-SA-Exim-Mail-From: enrico.scholz@sigma-chemnitz.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
	SPF_HELO_PASS,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] packaged-staging.bbclass: use 'os.unlink()' instead of spawning 'rm'
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
X-List-Received-Date: Wed, 17 Mar 2010 10:04:05 -0000
Content-Type: text/plain; charset=us-ascii

Tom Rini <tom_rini@mentor.com> writes:

> On Tue, 2010-03-16 at 13:23 +0100, Enrico Scholz wrote:
>> Doing a '-c clean' operation on a staged package with very much files
>> (e.g. glibc) took several minutes because
>> 
>> * every removed file was reported
>> * an 'rm' instance was spawned for every file
>> 
>> This patch uses the native 'os.unlink()' method for removing files and
>> reports only the removed root directory instead of the single files.
>
> We call os.unlink by itself in other places.  If we don't wrap it, could
> we get an exception, really (that wouldn't otherwise be a bug to fix) ?

os.unlink() throws an exception:

$ python -c 'import os; os.unlink("xxx")'
Traceback (most recent call last):
  File "<string>", line 1, in <module>
OSError: [Errno 2] No such file or directory: 'xxx'


When I worked on the patch I got such an exception (at least in one of
the hunks which replace 'rm -f').  I decided to be tolerant on errors
because there is no way to recover when '-c clean' fails.



Enrico


