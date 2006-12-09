Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1GszZn-0000Gn-IT
	for openembedded-devel@openembedded.org; Sat, 09 Dec 2006 11:37:03 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1GszYY-0004Nv-3u
	for openembedded-devel@openembedded.org; Sat, 09 Dec 2006 11:35:46 +0100
Received: from r77bc.r.ppp-pool.de ([89.54.119.188])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sat, 09 Dec 2006 11:35:46 +0100
Received: from no2spam by r77bc.r.ppp-pool.de with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sat, 09 Dec 2006 11:35:46 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
Date: Sat, 09 Dec 2006 11:35:36 +0100
Message-ID: <ele3hp$u6v$1@sea.gmane.org>
References: <elbohi$a8k$1@sea.gmane.org>
	<63497983.20061208141958@vanille-media.de>
Mime-Version: 1.0
X-Complaints-To: usenet@sea.gmane.org
X-Gmane-NNTP-Posting-Host: r77bc.r.ppp-pool.de
User-Agent: Thunderbird 1.5.0.8 (X11/20061117)
In-Reply-To: <63497983.20061208141958@vanille-media.de>
Sender: news <news@sea.gmane.org>
Subject: Re: RFC: encourage switch away from heanet.sf.net
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
X-List-Received-Date: Sat, 09 Dec 2006 10:37:03 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Michael 'Mickey' Lauer wrote:
>> Instead they automatically 302 you now.
> 
> If that's true, then +1 from me.

It seems they do.  And a sample session I wanted to provide as proof 
apparently also revealed how they deal with the situation that a mirror 
does not have the file.  I post only the relevant lines here.

$ wget http://downloads.sf.net/gakusei/qpf-unismall-100_1.0.0-r0_all.ipk
HTTP Anforderung gesendet, warte auf Antwort... 302 Found
Platz: 
http://downloads.sourceforge.net/gakusei/qpf-unismall-100_1.0.0-r0_all.ipk 
HTTP Anforderung gesendet, warte auf Antwort... 302 Found
Platz: 
http://ovh.dl.sourceforge.net/sourceforge/gakusei/qpf-unismall-100_1.0.0-r0_all.ipk 
HTTP Anforderung gesendet, warte auf Antwort... 200 OK

302 twice, then 200 from ovh.  Download successful.

$ rm qpf-unismall-100_1.0.0-r0_all.ipk
$ wget http://downloads.sf.net/gakusei/qpf-unismall-100_1.0.0-r0_all.ipk
HTTP Anforderung gesendet, warte auf Antwort... 302 Found
Platz: 
http://downloads.sourceforge.net/gakusei/qpf-unismall-100_1.0.0-r0_all.ipk 
HTTP Anforderung gesendet, warte auf Antwort... 302 Found
Platz: 
http://puzzle.dl.sourceforge.net/sourceforge/gakusei/qpf-unismall-100_1.0.0-r0_all.ipk 
HTTP Anforderung gesendet, warte auf Antwort... 302 Found
Platz: 
http://prdownloads.sourceforge.net/gakusei/qpf-unismall-100_1.0.0-r0_all.ipk?download&failedmirror=puzzle.dl.sourceforge.net 
HTTP Anforderung gesendet, warte auf Antwort... 301 Moved Permanently
Platz: 
http://downloads.sourceforge.net/gakusei/qpf-unismall-100_1.0.0-r0_all.ipk?download&failedmirror=puzzle.dl.sourceforge.net 
HTTP Anforderung gesendet, warte auf Antwort... 302 Found
Platz: 
http://osdn.dl.sourceforge.net/sourceforge/gakusei/qpf-unismall-100_1.0.0-r0_all.ipk 
HTTP Anforderung gesendet, warte auf Antwort... 200 OK

302 twice to puzzle which does not have the file and thus 302's again to 
prdownloads.  There is an added attribute that this file failed for the 
mirror and I assume that downloads.sf.net will act on that information 
for future downloads.  prdownloads sets a 301, we get another 302 and 
then osdn answers the request.  In some cases quite a few hops but it 
seems to work.

Out of curiousity, I tested out what happens with files that are not on 
the sf.net network.  It seems that one of two things happens.  If heanet 
is the first mirror being redirected to and it cannot find the file, it 
will answer with a 404 itself.  Otherwise, if some other mirror is used 
first, prdownloads will redirect to osdn which will redirect again to 
prdownloads with &failedmirror=osdn.dl.sourceforge.net.  A 404 is the 
answer.




