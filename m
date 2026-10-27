Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14662.1793092863073232653
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 02:21:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=tAD+LVSJ;
 spf=pass (domain: konsulko.com, ip: 209.85.128.41, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso39619485e9.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 02:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793092861; x=1793697661; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=igrIEbJFlH8zCoD8hK+yLfpiVNJazghMQ6HIoNt3/tA=;
        b=tAD+LVSJvASSja127ezSNgdYbgivwaduMXeI2lqch9Kga+3Oolk0RLacjQD/fAXSGz
         KONVQOAswkaFDOaGqbw6XdT7nvkFhF//NASMbzY9xapvkMcf2P0rdH2XJhah/GIZkTRK
         O65htHBpDEr92FBzX6V+F2il0Gs5fkgiHFVZ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793092861; x=1793697661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=igrIEbJFlH8zCoD8hK+yLfpiVNJazghMQ6HIoNt3/tA=;
        b=kkievVMjVndrW4Homg2k4+l8cCgaKG4LaPZktH5v1xpRnbAuM6tQ/i2GdTmZErawLe
         mV9zU62bK2zGIbwrjwkuyHrj8e8T2VqaLcADM20zUEk6xlIKfgf8+URKePqUYPqoBJjK
         wi6t7hMd22KZ/wZDve5pEr3bc/FSuTBKgze3um/QAOX7Nnwny3Mz8wpZQsfdeDWz3YGw
         CBCJwqJStgz9yQ/rjS4cmZ2KA40Aw+BFy9Rb2Aq4V3pNG7g0SuHSbvcipgRd2WXt+gCn
         rxps/mA1BcHCiHnx4aOOIWKLSSFX23QRvLrtBCJWR6salSc50ZkxxFjz6yALnyXi7B/d
         Yvgw==
X-Gm-Message-State: AFq9FYKM0qJxmeooLA+VdmBRtdlUEgP0KQYzWzbA1hqjQ9DSH9WfK2AT
	vVek/Uxs7XrwKXwvQWb3RT5ANdUzLBnE5nQyzS96ImurR6vrpfd8vz8LpHTsGtv9fWASD6gQiox
	R30KU
X-Gm-Gg: AYBFou1/xXCkw2upLx4CsSnp5IevKz4rnOJoW+Sq0de+6kukKPtQQ8YZ+QUPu62muOA
	jL0wv7Mz8gmzLsoYB1tRleP3Rg/WE8iTyZ2qrNcAF6+rils5/TzXzR09PVHnuajmWxW+CooJhMW
	jGaBQHE4HXYCEkoCOt9XZTLlU6v4NMlY72KpoUNcZjHNpl/ewv+xfqBBiCRC04C83e0EIvrY+Wp
	CZbHWOtBuOf1rZEe+4bJPJkFsTseGAfKhTMTHXHlZ37p6bVSeVUCnTlEBdsC+ZV6kDJ33z8v15t
	h2FMbEzgVgYiznjMuA+E4SZ0WHK/DXr6U0oo9NH+BzG523ztkcL1kh+go9yvjBSZWFcf4mFbaQN
	oaeLonEMuDMvRHkZo2iet5hHmogmfZi80F/JY39pbGmPDmVWsQqqncwpuHI7QcpK9IpDEZdHSYz
	i6PTBW+y9ETrHaIvXfnBKORsz/wczULnBYdisbR//XhJVGPpi4fdNoTovND+jo+/WfWLHNgpVXQ
	H4URKzXxOQSwKEsDszZdVJlck2OWJxIdBjqHmud3QUpg/mNGkeCOIu90BbytQOlzKJOFypWbc2G
	Vs3qw5JS+MQvdPHqB9VgVs1rW0kAS+hc0QkSS9D/wOLe8IciMBctuC5rgw+4YSH1S71BqJA77vV
	IEbAf
X-Received: by 2002:a05:600c:3b11:b0:4a1:dade:f049 with SMTP id 5b1f17b1804b1-4a35acbd3b3mr179736465e9.15.1793092860966;
        Tue, 27 Oct 2026 02:21:00 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a04ad39sm660086505e9.1.2026.10.27.02.20.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 02:21:00 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 27/61] python3-pyrad: Upgrade 2.5.4 -> 2.6.0
Date: Tue, 27 Oct 2026 11:19:54 +0200
Message-ID: <20261027092028.782979-27-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261027092028.782979-1-leon.anavi@konsulko.com>
References: <20261027092028.782979-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 09:21:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131491
Content-Type: text/plain; charset="utf-8"

Upgrade to release 2.6.0:

Breaking changes:

Check these before upgrading from 2.5.4. Details follow under Changes.

- Requirements: Python 3.10 or later; building from source needs
  setuptools 77 or later. The test and docs extras are replaced by
  dependency groups, so pip install pyrad[test] no longer installs
  pytest.
- Packets on the wire change:

  - Access-Request and Status-Server packets of Client and
    ClientAsync, and replies to them built with CreateReply(),
    carry a Message-Authenticator as first attribute; it shows up
    in keys(). Pass message_authenticator=False to leave it out.
  - Status-Server packets built with AcctPacket get a random
    Request Authenticator and a Message-Authenticator, as RFC 5997
    requires, instead of an Accounting-Request style authenticator.
    AcctPacket.VerifyAcctRequest() verifies the
    Message-Authenticator of Status-Server packets and fails
    without one, so code that calls it on Status-Server packets
    doesn't accept those of pyrad 2.5.4 clients, and pyrad 2.5.4
    doesn't accept those of this version. The pyrad servers don't
    answer Status-Server, and Status-Server on the authentication
    port is not affected.
  - CreateReply() copies the Proxy-State attributes of the request.
    A handler that copies them itself sends them twice, and the
    client rejects that reply.
  - An untagged Tunnel-Password, and an untagged value of a tagged
    string attribute starting with an octet up to 0x1F, are sent
    with the tag 0 (RFC 2868). Tunnel-Passwords without tag from
    pyrad 2.5.4 are still decoded.

- Packets that were accepted before are dropped:

  - Servers verify the Request Authenticator of Accounting-, CoA-
    and Disconnect-Requests (the Twisted integration:
    Accounting-Requests) by default (enable_pkt_verify=True).
    Clients whose secret doesn't match, e.g. accepted with a
    catch-all 0.0.0.0 hosts entry, are no longer served; pass
    enable_pkt_verify=False to accept them.
  - Servers drop Access-Requests with an invalid
    Message-Authenticator; this cannot be disabled. In ServerAsync
    enable_pkt_verify no longer affects Access-Requests.
  - Clients discard replies with an invalid Message-Authenticator
    or with a Proxy-State the request didn't have, so the request
    times out.
  - enforce_ma of the clients now requires a Message-Authenticator
    in replies to Access-Request and Status-Server; it no longer
    adds one to requests (that is the default now).
  - The blocking Server no longer passes Accounting-Response
    packets on the accounting port to HandleAcctPacket.
  - A Vendor-Specific attribute containing a malformed vendor TLV
    makes the whole packet invalid (PacketError).

- Attribute values read from packets change:

  - Tagged attributes (RFC 2868): pkt['Tunnel-Type'] returns the
    values, e.g. ['L2TP'] instead of 16777219 with the tag in the
    high octet, and the tag is stripped from string values. A
    received string value of a tagged attribute starting with an
    octet up to 0x1F is read as tag and value (RFC 2868).
  - Values of string attributes that are not valid UTF-8 are
    returned as bytes instead of str with replacement characters.
    This applies to every string attribute (e.g. a Latin-1
    Calling-Station-Id), not only User-Password.
  - Undefined TLV sub-attributes are returned keyed by their code
    instead of raising KeyError. A Vendor-Specific attribute whose
    sub-attribute lengths don't add up is kept as raw value of
    attribute 26.
  - pkt['Name'] = value, pkt['Name'], in and del of a TLV
    sub-attribute use its TLV instead of a top-level attribute with
    the sub-attribute's code.
  - PwCrypt('') returns 16 octets instead of none.

- Exception types change:

  - Values out of range or too long for their type or attribute
    raise ValueError instead of struct.error, which is not a
    subclass of ValueError.
  - Dictionary errors raise ParseError instead of ValueError,
    TypeError, KeyError or struct.error. ParseError is not a
    subclass of ValueError.
  - AddAttribute with a key that is not a name raises TypeError
    instead of AttributeError. PwDecrypt and SaltDecrypt of a value
    with a wrong length raise PacketError.
  - Decoding a value with the wrong length (e.g. integer, ipaddr,
    ipv6prefix) raises ValueError instead of struct.error or
    returning a wrong value.
  - ipaddr attributes reject IPv6 addresses, and strings longer
    than 253 octets in UTF-8 are rejected.

- Dictionaries:

  - Attributes pyrad cannot encode correctly are skipped with a
    warning instead of being loaded: vendors with a format other
    than 1,1 (e.g. USR, Lucent, Starent, WiMAX, Kineto,
    Alcatel-ESAM), nested TLVs (also TLV-typed sub-attributes,
    which loaded before), arrays (also those with has_tag or
    encrypt, which loaded before) and others. Code using them gets
    KeyError; see Dictionary.skipped_attributes.
  - A sub-attribute of a TLV of another vendor makes the dictionary
    fail to load with ParseError instead of being attached to the
    wrong TLV.
  - Reading a dictionary that skips attributes logs a warning on
    the pyrad logger.

- Servers and clients:

  - Client with auth_type='eap-md5': the EAP-Identity is the
    User-Name instead of the User-Password, the User-Password is
    not sent, and a request without User-Name or User-Password
    raises ValueError instead of using the User-Name as password.
  - The reply to a Disconnect-Request created with CreateReply() or
    CreateReplyPacket() is a Disconnect-ACK instead of a CoA-ACK; a
    handler that sets reply.code is not affected.
  - An exception raised by a handler of the blocking Server or
    Proxy is logged and the packet dropped; it no longer stops
    Run().
  - Proxy passes Access-Challenge, CoA-ACK/NAK and
    Disconnect-ACK/NAK replies on the proxy socket to
    _HandleProxyPacket instead of dropping them.
  - Twisted integration: the RADIUS constructor takes (hosts=None,
    dict=None, enforce_ma=False, enable_pkt_verify=True), hosts
    must map addresses to RemoteHost instances or secrets, and an
    overridden createPacket is called.
  - ClientAsync: requests pending when the transport is closed fail
    with ConnectionAbortedError (a request nobody awaits logs
    "Future exception was never retrieved"); retransmissions send
    the bytes of the first attempt, so changes to the packet after
    SendPacket are not sent; a request is retried only after
    timeout seconds, so a request times out after (retries + 1) *
    timeout seconds; CreatePacket raises if all 256 ids are in use
    (the Create*Packet methods raise Exception).
  - ClientAsync and ServerAsync: loop is a property. Without a loop
    passed to the constructor it returns the running loop at the
    time it is used.

Changes:

- BlastRADIUS (CVE-2024-3596) countermeasures (#200):

  - Clients add a Message-Authenticator to all Access-Request and
    Status-Server packets by default.
  - Clients always verify a Message-Authenticator in replies
    (enforce_ma verified the request instead) and discard replies
    with unexpected Proxy-State attributes.
  - Servers add a Message-Authenticator to all replies to
    Access-Requests, verify it in received Access-Requests and can
    require it with the new enforce_ma option.
  - Message-Authenticator is added as first attribute and
    verification uses the correct authenticator for received
    replies, including CoA/Disconnect ACK/NAK and replies to
    Status-Server.
  - With enforce_ma, clients require a Message-Authenticator in
    replies to Access-Request and Status-Server packets.

- The FreeRADIUS dictionary files can be read as they are (#173).
  Attributes that pyrad does not support, such as the RFC 6929
  extended attributes, attributes of the types vsa, ipv4prefix,
  combo-ip, bool, uint16 and uint32, arrays, nested TLVs and
  attributes of vendors with a format other than format=1,1 (e.g.
  USR, Lucent, Starent, WiMAX, Kineto, Alcatel-ESAM), which pyrad
  encoded as format=1,1 before, are skipped with a warning and
  listed in Dictionary.skipped_attributes. The flags secret and
  virtual and BEGIN-VENDOR with a format= option are accepted.
  Attributes with the concat flag, such as EAP-Message, are loaded
  as normal attributes instead of being dropped. A VALUE for an
  unknown attribute is ignored with a warning instead of raising a
  ParseError, and a sub-attribute of an unknown TLV raises a
  ParseError instead of a KeyError.
- Fix salt decryption (encrypt=2, e.g. Tunnel-Password) of received
  Accounting-, CoA- and Disconnect-Requests, which used the Request
  Authenticator instead of zeros, and salt encryption of these
  requests after RequestPacket() was called. An Access-Request with
  salt encrypted attributes got an all-zero Request Authenticator,
  so the User-Password encryption was the same in every request; it
  gets a random one now.
- Fix crashes on malformed or unusual packets: a vendor TLV that
  was not the first sub-attribute of a Vendor-Specific attribute,
  or that appeared in more than one, raised AttributeError while
  decoding, which stopped the blocking server with a single
  unauthenticated packet. An empty TLV made VerifyReply raise
  ValueError instead of rejecting a forged reply, and reading a TLV
  with an undefined sub-attribute raised KeyError (undefined
  sub-attributes are returned as raw values keyed by their code
  now). PwDecrypt raises PacketError for a password that is not a
  multiple of 16 octets instead of IndexError.
- The blocking Server (and Proxy) drops and logs packets for which
  a handler raises an exception, instead of stopping the main loop,
  like ServerAsync does. Unexpected exceptions while decoding a
  packet are treated as a broken packet.
- ClientAsync: a request cancelled by the caller, e.g. with
  asyncio.wait_for, or a failing retransmission killed the timeout
  handler, so no later request on that transport was retried or
  timed out and they waited forever. A packet that could not be
  encoded was left pending and killed the timeout handler when it
  expired. Requests that are still pending when the transport is
  closed fail with ConnectionAbortedError instead of waiting
  forever.
- ClientAsync and ServerAsync created without a loop use the
  running event loop instead of calling asyncio.get_event_loop() in
  the constructor, which fails outside of a running loop on Python
  3.14. loop is a property that returns the running loop when it is
  used.
- Client:

  - Timeouts use a monotonic clock, so a step of the system clock
    no longer extends the wait for a reply.
  - A late reply to an earlier attempt of an Accounting-Request,
    whose Request Authenticator changed with Acct-Delay-Time, is
    accepted instead of timing out. Retrying an Accounting-Request
    no longer fails with KeyError if the dictionary has no
    Acct-Delay-Time.
  - The EAP-MD5 challenge response only hashes the Value of the
    challenge, so challenges with a Name work, and the
    Access-Request answering the Access-Challenge has a new
    Identifier and Request Authenticator (RFC 2865 section 4.4).
  - EAP-MD5 works with FreeRADIUS: the EAP-Identity is the
    User-Name instead of the password, which was sent in clear
    (#151), and the cleartext User-Password is only used for the
    MD5 response instead of being sent in clear with the
    EAP-Message, which RFC 3579 section 3.3 doesn't allow.
    Challenges without State, EAP packets split over several
    EAP-Message attributes and challenges of other EAP types (which
    are returned) are handled. An EAP-Identity longer than one
    attribute is split over several EAP-Message attributes.
  - ClientAsync authenticates with EAP-MD5 like Client for packets
    with auth_type='eap-md5'; it sent them as they were, with the
    cleartext User-Password and without answering the challenge.
  - A Client without a dictionary can send Access-Requests again.

- ClientAsync and ServerAsync:

  - initialize_transports can be retried after a transport failed
    to open (e.g. a DNS or bind error) or the call was cancelled
    (e.g. by asyncio.wait_for); the failed or closed transport
    stayed registered.
  - ClientAsync doesn't hand out the id of a pending request, so
    more than 256 requests over time no longer fail with "Packet
    with id N already present"; it raises only if all 256 ids are
    in use. CreatePacket accepts the id 0.
  - ClientAsync timeouts use a monotonic clock, and the dates in
    pending_requests are time.monotonic() values.
  - ClientAsync retransmits the bytes encoded for the first attempt
    instead of encoding the packet again.
  - Transports are opened on platforms without SO_REUSEPORT (e.g.
    Windows), and ClientAsync binds to local_addr also without a
    local port.
  - The ClientAsync retries documentation is corrected (a request
    is sent up to retries + 1 times) and the asyncio examples work
    on Python 3.14.

- Servers and Proxy:

  - IPv4 clients of a dual stack server bound to '::' (source
    ::ffff:a.b.c.d) are matched against their IPv4 hosts entry, in
    Server, Proxy, ServerAsync and the Twisted integration.
  - Proxy accepts Access-Challenge, CoA-ACK/NAK and
    Disconnect-ACK/NAK replies on the proxy socket instead of
    dropping them.
  - Twisted integration (pyrad.curved): packets are decoded with
    the packet class of RADIUSAccess/RADIUSAccounting (an
    overridden createPacket that returns None gets a generic
    packet) and get the client's secret, the Message-Authenticator
    of Access-Requests (BlastRADIUS) and the Request Authenticator
    of Accounting-Requests are verified (new enforce_ma and
    enable_pkt_verify arguments), and the default hosts and
    dictionary are no longer shared between instances. The hosts
    must map to RemoteHost instances or to the secrets; packets of
    hosts without a secret, e.g. given as a set or list of
    addresses, are dropped and logged.
  - Twisted integration: exceptions raised by packet handlers
    (including pyrad.packet.PacketError and ServerPacketError) or
    by createPacket are now dropped and logged, like in Server.Run
    and ServerAsync. Packets that fail to decode are logged with
    one line, without a traceback.

- Packets:

  - Received packets longer than their Length field are accepted,
    the extra octets are ignored as padding (RFC 2865 section 3).
  - VerifyReply(reply) without rawreply verifies a received reply
    with the bytes it was decoded from, instead of rejecting and
    modifying it.
  - PwCrypt encrypts an empty password as 16 octets and raises
    ValueError for passwords longer than 128 octets (RFC 2865
    section 5.2).
  - Values too long for an attribute, a Vendor-Specific or TLV
    wrapper or salt encryption raise ValueError instead of
    struct.error, and a TLV whose first sub-attributes are long is
    no longer preceded by an empty TLV.
  - Setting a TLV sub-attribute with pkt['Name'] = value stores it
    in its TLV; it was sent as a top-level attribute with the
    sub-attribute's code. Getting, testing (in) and deleting a
    sub-attribute by name use its TLV as well, instead of a
    top-level attribute with the same code.
  - VerifyChapPasswd returns False without CHAP-Password instead of
    raising TypeError, and compares in constant time.
  - Status-Server built with AcctPacket gets a random Request
    Authenticator and a valid Message-Authenticator, and replies to
    it are signed with its Request Authenticator (RFC 5997).
    VerifyAcctRequest verifies the Message-Authenticator of
    Status-Server packets.
  - A packet created without a dictionary has dict set to None
    (unless its class defines one), so CreateReply() of such a
    received packet works.
  - The VerifyAuthRequest documentation says what it checks.

- Attribute values:

  - ipaddr values reject IPv6 addresses with ValueError instead of
    encoding 16 octets (RFC 8044 section 3.8).
  - The 253 octet limit of string values is checked on the UTF-8
    encoded value.
  - ipv6prefix values given as netaddr.IPNetwork clear the host
    bits and reject IPv4 networks, like str values.
  - Out of range integer, signed, short, byte, integer64 and date
    values raise ValueError instead of struct.error.
  - Ascend binary filters raise ValueError if an address doesn't
    match the filter family instead of producing a malformed
    filter, and terms may be separated by any whitespace.
  - The ifid (e.g. Framed-Interface-Id, RFC 3162) and ether types
    can be encoded and decoded.

- Dictionaries:

  - TLV sub-attributes are no longer attached to a TLV with the
    same code of another vendor (the dictionary fails to load with
    ParseError), and TLVs defined in one dictionary file are found
    by sub-attributes in another.
  - Malformed attribute codes, vendor codes and VALUE definitions
    raise ParseError with file and line instead of ValueError,
    TypeError or struct.error. VALUE definitions for date
    attributes work.
  - A dictionary file that includes itself raises ParseError
    instead of looping forever, and the FreeRADIUS $INCLUDE-
    directive (include if the file exists) is supported.
  - A redefined attribute or value name is no longer decoded to its
    old name (stale BiDict reverse entries). Deleting a BiDict
    value removes all keys mapping to it, and deleting one of
    several keys of a value keeps the reverse entry of the others.

- The package metadata declares the license as the SPDX expression
  BSD-3-Clause (PEP 639); building requires setuptools 77 or later.
  The test and docs extras are replaced by the dependency groups of
  the same names (uv sync --all-groups or pip install --group
  test).
- The FreeRADIUS dictionary of the examples is an attributed
  excerpt of the current FreeRADIUS dictionary (CC-BY 4.0), and
  names attribute 182 FreeRADIUS-Queue-PPS-Out instead of
  FreeRADIUS-Queue-PPS-In.
- Fix an infinite loop when decoding a vendor-specific or TLV
  sub-attribute with a length of 0, which let a single
  unauthenticated packet hang a server (#234). Truncated TLVs raise
  a PacketError instead of struct.error.
- Fix salt decryption of values longer than 16 bytes, such as
  MS-MPPE-Send-Key, MS-MPPE-Recv-Key and long Tunnel-Passwords.
- Fix PwDecrypt of the decoded User-Password attribute, which
  failed since 2.5 because invalid UTF-8 was decoded with
  replacement characters (#232, #192). Values of all string
  attributes that are not valid UTF-8 are returned as bytes now.
- Fix ServerAsync dropping all Access-Requests with
  enable_pkt_verify=True (#178). enable_pkt_verify no longer
  applies to Access-Requests, whose Message-Authenticator is always
  verified.
- Fix decoding of tagged attributes (RFC 2868). The tag is stripped
  from the values, pkt['Tunnel-Type'] returns the values of all
  tags and pkt['Tunnel-Type:1'] the values with tag 1. Decoding a
  tagged Tunnel-Password no longer fails, and an untagged
  Tunnel-Password is sent with the mandatory tag 0. A
  Tunnel-Password without tag, as sent by older pyrad versions, is
  still decoded. An untagged string value starting with an octet up
  to 0x1F is sent with the tag 0, so that it isn't read as tag.
- Fix ClientAsync decrypting salt encrypted reply attributes, such
  as Tunnel-Password and MS-MPPE-Send-Key, with the wrong
  authenticator.
- Copy Proxy-State attributes into replies (RFC 2865 section 5.33).
- Decoding an integer, signed, short, byte, date, integer64, ipaddr
  or ipv6prefix attribute with a value of the wrong length, or an
  ipv6addr attribute with a value longer than 16 octets, raises a
  ValueError instead of struct.error or returning a wrong value,
  such as an IPv6 address for a 16 byte ipaddr value (#13). Shorter
  ipv6addr values are still padded with zeros.
- Replies to Disconnect-Requests created with CreateReply() or the
  CreateReplyPacket() of the servers are Disconnect-ACKs instead of
  CoA-ACKs (RFC 5176 section 3).
- Fix Host.SendPacket(fd, pkt), which called the missing method
  pkt.Packet() and always raised AttributeError; it sends
  pkt.RequestPacket() to pkt.source.
- AddAttribute raises a TypeError with a clear message when the key
  is not an attribute name, e.g. when the key and value arguments
  are swapped (#17).
- Fix encoding of binary octets values starting with b"0x", such as
  a CHAP-Password with CHAP ID 48, which failed with "Odd-length
  string" or "Non-hexadecimal digit found". Bytes values are only
  decoded as hex if the rest of the value is valid hex (#49).
- Fix the length of CoA and Disconnect requests with
  Message-Authenticator.
- Fix ClientAsync retrying and timing out requests before the
  timeout passed.
- Verify the request authenticator of Accounting, CoA and
  Disconnect requests by default. The blocking Server never
  verified them and ServerAsync only with enable_pkt_verify=True;
  both now default to verification and can opt out with
  enable_pkt_verify=False. Server no longer accepts
  Accounting-Response packets on the accounting port.
- Drop support for Python 3.8 and 3.9, which are end of life; pyrad
  requires Python 3.10 or later.
- Replace deprecated datetime.utcnow() and Logger.warn calls in the
  asyncio client and server.
- Fix the examples in the README, the docs and the package
  docstring.
- Add a usage guide to the documentation (attributes, tagged and
  encrypted attributes, accounting, CoA, Status-Server, EAP-MD5,
  servers, asyncio, errors and logging, Proxy and Twisted) and the
  API documentation of ClientAsync, ServerAsync, the Twisted
  integration and the dictionary Attribute and BiDict classes. The
  API documentation shows the constructor parameters, and the
  docstrings were corrected and completed (e.g. retries, default
  reply codes, what servers verify before calling a handler,
  ServerAsync handlers must not be coroutines).
- The dictionary parse error for an attribute definition with a
  wrong number of fields now includes the file name.
- Fix wrong and missing parameter types and descriptions in the
  docstrings (secrets and raw packets are bytes, AddAttribute only
  takes attribute names) and document the asyncio transport and
  handler methods.

License-Update: Copyright years and authors updated

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-pyrad_2.5.4.bb => python3-pyrad_2.6.0.bb}       | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pyrad_2.5.4.bb => python3-pyrad_2.6.0.bb} (55%)

diff --git a/meta-python/recipes-devtools/python/python3-pyrad_2.5.4.bb b/meta-python/recipes-devtools/python/python3-pyrad_2.6.0.bb
similarity index 55%
rename from meta-python/recipes-devtools/python/python3-pyrad_2.5.4.bb
rename to meta-python/recipes-devtools/python/python3-pyrad_2.6.0.bb
index 443b280e26..fed20ae2ca 100644
--- a/meta-python/recipes-devtools/python/python3-pyrad_2.5.4.bb
+++ b/meta-python/recipes-devtools/python/python3-pyrad_2.6.0.bb
@@ -1,9 +1,10 @@
 SUMMARY = "RADIUS tools"
+DESCRIPTION = "Python RADIUS Implementation"
 SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=53dbfa56f61b90215a9f8f0d527c043d"
+LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=c97c15f70e2734c8ce7c0d636e662aa8"
 
-SRC_URI[sha256sum] = "e039c48a026c988d49276bd7c75795f55e0e4c2788f7ddf09419ce0e191a154d"
+SRC_URI[sha256sum] = "26d23ca80cde9f50d5ef0167d4c7f2bbfe218d85e207f2c0ca31dddd00a5deee"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.47.3

