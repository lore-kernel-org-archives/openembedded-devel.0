Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.67)
	(envelope-from <tobias.pflug@gmx.net>) id 1IljcO-0003xC-KH
	for openembedded-devel@lists.openembedded.org;
	Sat, 27 Oct 2007 13:14:16 +0200
Received: (qmail invoked by alias); 27 Oct 2007 11:06:43 -0000
Received: from p549AA970.dip0.t-ipconnect.de (EHLO [192.168.1.100])
	[84.154.169.112]
	by mail.gmx.net (mp046) with SMTP; 27 Oct 2007 13:06:43 +0200
X-Authenticated: #283898
X-Provags-ID: V01U2FsdGVkX19wba0Dvvxwyb0dqtl/k7ZDywc6+C/6XGak71rVic
	OOyTFm/KfW7JuM
From: Tobias Pflug <tobias.pflug@gmx.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20071026134528.GA6182@lenovo>
References: <471FC1C0.4010103@linux.it> <20071025001926.GA14645@lenovo>
	<472047C3.20208@student.utwente.nl> <20071025121153.GA8231@lenovo>
	<f96d234e0710251034s488b9c13me8c4d9731638a94e@mail.gmail.com>
	<20071026134528.GA6182@lenovo>
Date: Sat, 27 Oct 2007 13:06:59 +0200
Message-Id: <1193483219.6376.100.camel@toontown>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.0 
X-Y-GMX-Trusted: 0
Subject: Re: getting started - docbook
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
X-List-Received-Date: Sat, 27 Oct 2007 11:14:17 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

i am jumping into this discussion a bit late as I had not much time
recently. I also recently started working with openembeded at work
as I convinced my boss that it's the best way to go for our embedded
product. 

Now i've spent some good time getting into it and understanding the
use cases / patterns behind it. I am pretty sure that I still don't
get the full picture and partially things are still a bit of a black
box to me. So I am glad to see a discussion coming up about
documentation on this list. I'd very much like to share my point
of view on it and I am also very willing and interested in helping
out with updating and extending the existing documentation. (hi david..)

So to get to the facts - I think there are basically two issues
with the documentation as of now:

(1): big picture
(2): bitbake


on 1: 
with big picture I mean there should be a description of the 
"system" with its main components. Currently i think there is too
little of that, and too many use-cases. ("In order to change xyz,
apply abc to 123").

For starters a diagram would do some good. I did one for a small
report at work which however is rather incomplete. I should polish
that a little. Depicting the interaction between bitbake, the different
config file sets, internet resources, distributions and images. I think
all of this should be presented before even starting to elaborate on
how to build something


on 2:
To me the biggest black box is still bitbake. The documentation
seems somewhat lacking and I have a bad feeling about carrying out tasks
where I don't quite understand what's going on. 

I still don't quite get how the dependency checking works and when
changes to specific files will trigger an automatic rebuild and when
I'll have to trigger that myself with a -crebuild / or maybe even 
by fiddling with timestamps? Although my guts tell me that the latter
is a NO-NO.

David, I gather you are still working on the setup section? Maybe I
could try contributing a "big picture" description, however my
text will certainly require a lot of refinement from those with
more background knowledge. 

David, will you also write on how to set up an OEDEV directory sturcure/
sharing of working directories etc? Personally I am using the structure
that cliff presented on the ml (I think) at some point which I find
comfortable.

best regards and a nice weekend,
Tobi

PS: A little off-topic sidenote to any potential compulab board owners..
do not fiddle around with GPIO commands in armmon. My devboard is
unusable right now and resetting via jumpers does not help ;/





