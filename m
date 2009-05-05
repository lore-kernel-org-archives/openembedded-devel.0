Received: from [74.125.78.149] (helo=ey-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1M1O7B-0003wq-Vg
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 May 2009 19:07:34 +0200
Received: by ey-out-1920.google.com with SMTP id 26so1831444eyw.36
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 May 2009 10:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=2yWZstDeEbDIClO59YuLqln3jxcrG/n/q+4CuClTlCg=;
	b=lWNJNYqBVxKGcOcuVV6eBnqZlTzHrYP/jYBUN80jtWc++Lwn+rKYznfXtgbKT17LiJ
	rssXG7NkpHw8bE2kyZNXlrTABJ8eCe/rcZ5sNz5X/7NP5HqNk4Y1q2WNAU7aL/2Tycya
	rxe4dLfMOw/akoMcXkAYugsznwQDYFhWhs+7k=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type;
	b=X8ezCnFROkFZ2Ux0DlTTgM+nXweoU4/tcFC71tzm9pG7bT9BZ4XYhREnoIwGNA8jEV
	yHbE0eQj3Y0YdBht5stifatRbJavq3AkaJvs7g0vgwh+Q4+8NhfqSz/aCcAifEMXx2kM
	O3KaDwK5qUvKZupz7UTSpq/hxQ+6Se1B/5eiw=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.231.36.77 with SMTP id s13mr157413ibd.1.1241542899065; Tue, 05 
	May 2009 10:01:39 -0700 (PDT)
Date: Tue, 5 May 2009 14:01:39 -0300
X-Google-Sender-Auth: 916bd313ab7edd75
Message-ID: <be7a9f3d0905051001p5a933c2ds1c77b9b8afb75647@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: [RFC] Use of an INC_PR var when using a .inc file common to multiple recipes
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
X-List-Received-Date: Tue, 05 May 2009 17:07:34 -0000
X-Groupsio-MsgNum: 10031
Content-Type: multipart/mixed; boundary=0022152d5d6578e65204692d3b4a

--0022152d5d6578e65204692d3b4a
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello,

I've been noticing how boring is to update .inc files that are used by
many recipes. It's also risky since we can easily forget to update a
required bb  file or, in worse case, a new bb can be included in the
overlay and it won't be updated with the changes done on the .inc
file.

To solve it, I'd like to recommends the usage of the way I did for
firefox-l10n packages. I'm adding them just for reference.

What people think about it?

-- 
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br

--0022152d5d6578e65204692d3b4a
Content-Type: application/octet-stream; name="firefox-l10n.inc"
Content-Disposition: attachment; filename="firefox-l10n.inc"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_fucujh600

IyBDb3B5cmlnaHQgKEMpIDIwMDksIE8uUy4gU3lzdGVtcyBTb2Z0d2FyZSBMdGRhLiBBbGwgUmln
aHRzIFJlc2VydmVkCiMgUmVsZWFzZWQgdW5kZXIgdGhlIE1JVCBsaWNlbnNlIChzZWUgcGFja2Fn
ZXMvQ09QWUlORykKCmRlZiBnZXRfbGFuZ3VhZ2VfbmFtZShwYWNrYWdlKToKICAgIGxhbmcgPSBw
YWNrYWdlLnJlcGxhY2UoJ2ZpcmVmb3gtbDEwbi0nLCAnJykKCiAgICBpZiBsYW5nLmZpbmQoJy0n
KToKICAgICAgICBsYW5nID0gbGFuZy5zcGxpdCgnLScpCiAgICAgICAgbGFuZ1sxXSA9IGxhbmdb
MV0udXBwZXIoKQogICAgICAgIGxhbmcgPSAnLScuam9pbihsYW5nKQoKICAgIHJldHVybiBsYW5n
CgpERVBFTkRTID0gInVuemlwLW5hdGl2ZSIKUkRFUEVORFMgPSAiZmlyZWZveCIKTEFOR1VBR0Ug
PSAiJHtAZ2V0X2xhbmd1YWdlX25hbWUoJyR7UE59Jyl9IgoKU1JDX1VSSSA9ICJodHRwOi8vcmVs
ZWFzZXMubW96aWxsYS5vcmcvcHViL21vemlsbGEub3JnL2ZpcmVmb3gvcmVsZWFzZXMvJHtQVn0v
bGludXgtaTY4Ni94cGkvJHtMQU5HVUFHRX0ueHBpIgpTID0gIiR7V09SS0RJUn0iCgpkb19jb25m
aWd1cmUoKSB7Cgl1bnppcCAtbyAtcSAtZCAke0xBTkdVQUdFfSAke0xBTkdVQUdFfS54cGkKfQoK
SU5DX1BSID0gInIxIgoKZG9faW5zdGFsbCgpIHsKCWNkICR7U30vJHtMQU5HVUFHRX0KCgkjIEdl
dCBleHRlbnNpb24gVVVJRAoJRVhURU5TSU9OPWBjYXQgaW5zdGFsbC5yZGYgfCBzZWQgLS1wb3Np
eCAnL2VtOmlkPS8hZDtzL1sgXSplbTppZD0iLy87cy8iLiovLydgCgoJbWtkaXIgLXAgJHtEfS91
c3IvbGliL2ZpcmVmb3gtJHtQVn0vZXh0ZW5zaW9ucy8ke0VYVEVOU0lPTn0vY2hyb21lCglta2Rp
ciAtcCAke0R9L3Vzci9saWIvZmlyZWZveC0ke1BWfS9leHRlbnNpb25zLyR7RVhURU5TSU9OfS91
bmluc3RhbGwKCWluc3RhbGwgLW0gNjQ0IGNocm9tZS8qLmphciAke0R9L3Vzci9saWIvZmlyZWZv
eC0ke1BWfS9leHRlbnNpb25zLyR7RVhURU5TSU9OfS9jaHJvbWUKCWluc3RhbGwgLW0gNjQ0IGlu
c3RhbGwucmRmICR7RH0vdXNyL2xpYi9maXJlZm94LSR7UFZ9L2V4dGVuc2lvbnMvJHtFWFRFTlNJ
T059CglpbnN0YWxsIC1tIDY0NCBjaHJvbWUubWFuaWZlc3QgJHtEfS91c3IvbGliL2ZpcmVmb3gt
JHtQVn0vZXh0ZW5zaW9ucy8ke0VYVEVOU0lPTn0KCgljYXQgaW5zdGFsbC5yZGYgXAoJICAgfCBz
ZWQgLS1wb3NpeCAnLzxlbTpsb2NhbGU+LyFkJyBcCgkgICB8IHNlZCAtLXBvc2l4ICJzLy4qL3Jl
Z2lzdGVyICAgICAgZ2xvYmFsICBsb2NhbGUgICR7TEFOR1VBR0V9LyIgXAoJICAgPiAke0R9L3Vz
ci9saWIvZmlyZWZveC0ke1BWfS9leHRlbnNpb25zLyR7RVhURU5TSU9OfS91bmluc3RhbGwvVW5p
bnN0YWxsCn0KCkZJTEVTXyR7UE59ICs9ICIvdXNyL2xpYi9maXJlZm94LSR7UFZ9IgpQQUNLQUdF
X0FSQ0ggPSAiYWxsIgo=

--0022152d5d6578e65204692d3b4a
Content-Type: application/octet-stream; name="firefox-l10n-pt-br_3.0.4.bb"
Content-Disposition: attachment; filename="firefox-l10n-pt-br_3.0.4.bb"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_fucuk6oj1

IyBDb3B5cmlnaHQgKEMpIDIwMDksIE8uUy4gU3lzdGVtcyBTb2Z0d2FyZSBMdGRhLiBBbGwgUmln
aHRzIFJlc2VydmVkCiMgUmVsZWFzZWQgdW5kZXIgdGhlIE1JVCBsaWNlbnNlIChzZWUgcGFja2Fn
ZXMvQ09QWUlORykKCnJlcXVpcmUgZmlyZWZveC1sMTBuLmluYwoKUFIgPSAiJHtJTkNfUFJ9LjEi
Cg==

--0022152d5d6578e65204692d3b4a--
